# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name = "remove_emoji"
  spec.version = "4.0.0"
  spec.authors = ["Guanting112"]

  spec.summary = %q{ Remove Emoji 🚫😱 ( for Ruby 2.x ~ 4 / Rails 4 ~ 8 )}
  spec.description = %q{ Remove Emoji 🚫😱 ( for Ruby 2.x ~ 4 / Rails 4 ~ 8 )}
  spec.homepage = "https://github.com/guanting112/remove_emoji"
  spec.license = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{lib}/**/*", "LICENSE", "README.md"]
  end
  spec.require_paths = ["lib"]

  spec.add_development_dependency "rspec", "~> 3.0"
end
