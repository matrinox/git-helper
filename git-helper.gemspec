# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'git-helper/version'

Gem::Specification.new do |spec|
  spec.name          = "git-helper"
  spec.version       = GitHelper::VERSION
  spec.authors       = ["matrinox"]
  spec.email         = ["geofflee25@gmail.com"]

  spec.summary       = "Simplifies git using common git workflows"
  spec.description   = "Provides git shortcuts to common git workflows.\nIt also allows customization via per-repo persistent settings or on-the-fly. The main standout feature is repair, which aims to fix issues in your branch such as a failed rebase resulting in duplicate commits with different SHA's.\nOther features include creating branches from Pivotal Tracker ticket numbers, finishing branches & notifying Tracker, advanced branch searching, and powerful branch/commit copying"
  spec.homepage      = ""
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"

  spec.add_dependency "highline"#, "~> 2.0.0"
  spec.add_dependency "git", "~> 1.2.9.1"
  spec.add_dependency "plist", "~> 3.1.0"
end
