require_relative 'lib/gosu_notifications/version'

Gem::Specification.new do |spec|
  spec.name          = "gosu_notifications"
  spec.version       = GosuNotifications::VERSION
  spec.authors       = ["cyberarm"]
  spec.email         = ["matthewlikesrobots@gmail.com"]

  spec.summary       = "A simple notifications system for Gosu"
  spec.description   = "A simple notifications system for Gosu  "
  spec.homepage      = "https://github.com/cyberarm/gosu_notifications"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = "htpps://rubygems.org"

  spec.metadata["homepage_uri"] = spec.homepage

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
