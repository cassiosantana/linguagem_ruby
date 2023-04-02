# frozen_string_literal: true

require_relative "lib/my_study_ruby/version"

Gem::Specification.new do |spec|
  spec.name = "my_study_ruby"
  spec.version = MyStudyRuby::VERSION
  spec.authors = ["Cassio Santana"]
  spec.email = ["cassioo.roger@gmail.com"]

  spec.summary = "Estudo Ruby"
  spec.description = "Este projeto foi criado para guardar meus estudos da linguagem ruby e seu ecossistema"
  spec.homepage = "https://github.com/cassiosantana"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.0.5"

  spec.metadata["allowed_push_host"] = "https://github.com/cassiosantana"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/cassiosantana"
  spec.metadata["changelog_uri"] = "https://github.com/cassiosantana"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"
  spec.add_development_dependency "rspec", "~> 3.2"

  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html
end
