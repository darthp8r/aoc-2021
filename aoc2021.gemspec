
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "aoc2021/version"

Gem::Specification.new do |spec|
  spec.name          = "aoc2021"
  spec.version       = Aoc2021::VERSION
  spec.authors       = ["darthp8r"]
  spec.email         = ["darthp8r@gmail.com"]

  spec.summary       = %q{Advent of Code 2021, ruby version}
  spec.description   = %q{
    Advent of Code 2021 in one big@$$ all-inclusive gem.
    Refer to the `rspec` tests for day-to-day code descriptions,
    with the "Actual" `describe` stanzas using live data (no expectations therein).
  }
  spec.homepage      = %q{https://github.com/darthp8r/aoc2021.rb}

# # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
# # to allow pushing to a single host or delete this section to allow pushing to any host.
# if spec.respond_to?(:metadata)
#   spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

#   spec.metadata["homepage_uri"] = spec.homepage
#   spec.metadata["source_code_uri"] = %q{https://github.com/darthp8r/aoc2021.rb}
#   spec.metadata["changelog_uri"] = %q{https://github.com/darthp8r/aoc2021.rb/CHANGELOG.md}
# else
#   raise "RubyGems 2.0 or newer is required to protect against " \
#     "public gem pushes."
# end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
# spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
#   `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
# end
  spec.files         = Dir["*.md","{bin,lib,spec}/**/*.rb"]
# spec.bindir        = "bin"
# spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.2"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
