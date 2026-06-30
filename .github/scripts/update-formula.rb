#!/usr/bin/env ruby
# frozen_string_literal: true

require "json"
require "erb"

TEMPLATE_PATH = ".github/templates/binary-formula.rb.erb"
FORMULAE = {
  "fgvm" => {
    desc: "Friendly Godot version manager",
    archives: {
      "macos" => { "arm" => "fgvm-osx-arm64.tar.gz", "intel" => "fgvm-osx-x64.tar.gz" },
      "linux" => { "arm" => "fgvm-linux-arm64.tar.gz", "intel" => "fgvm-linux-x64.tar.gz" },
    },
  },
}.freeze

def defaults_for(name)
  {
    name: name,
    class_name: name.split("-").map(&:capitalize).join,
    path: "Formula/#{name}.rb",
    binary: name,
    license: "MIT",
  }
end

def ruby_string(value) = value.dump

def output(key, value)
  line = "#{key}=#{value}"
  puts line
  File.write(ENV["GITHUB_OUTPUT"], "#{line}\n", mode: "a") if ENV["GITHUB_OUTPUT"]
end

def usage
  <<~USAGE
    Usage:
      curl -fsSL https://api.github.com/repos/OWNER/REPO/releases/latest | ruby #{$PROGRAM_NAME} FORMULA

    Available formulae: #{FORMULAE.keys.join(", ")}
  USAGE
end

abort usage unless ARGV.length == 1

formula_name = ARGV.first
abort "Unknown formula: #{formula_name}\n\n#{usage}" unless FORMULAE.key?(formula_name)

formula = defaults_for(formula_name).merge(FORMULAE.fetch(formula_name))
release_json = $stdin.read
abort "Expected GitHub release JSON on stdin.\n\n#{usage}" if release_json.strip.empty?

release = JSON.parse(release_json)

tag = release.fetch("tag_name")
version = tag.delete_prefix("v")
homepage = formula.fetch(:homepage, release.fetch("html_url").sub(%r{/releases/tag/.*\z}, ""))
assets_by_name = release.fetch("assets").to_h { |asset| [asset.fetch("name"), asset] }

platforms = formula.fetch(:archives).map do |os, archive_names_by_arch|
  archives = archive_names_by_arch.map do |arch, archive_name|
    archive = assets_by_name.fetch(archive_name)
    {
      arch: arch,
      url: archive.fetch("browser_download_url"),
      sha256: archive.fetch("digest").delete_prefix("sha256:"),
    }
  end

  { os: os, archives: archives }
end

rendered_formula = ERB.new(File.read(TEMPLATE_PATH), trim_mode: "-").result(binding)

formula_path = formula.fetch(:path)
current_formula = File.exist?(formula_path) ? File.read(formula_path) : ""
changed = rendered_formula != current_formula
File.write(formula_path, rendered_formula) if changed

output("formula", formula.fetch(:name))
output("file", formula_path)
output("tag", tag)
output("version", version)
output("changed", changed)
