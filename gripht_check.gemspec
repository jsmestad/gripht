# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{gripht_check}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Justin Smestad"]
  s.date = %q{2009-05-22}
  s.email = %q{justin.smestad@gmail.com}
  s.extra_rdoc_files = [
    "LICENSE",
     "README.textile"
  ]
  s.files = [
    ".gitignore",
     "LICENSE",
     "README.textile",
     "Rakefile",
     "TODO",
     "VERSION",
     "config.ru.example",
     "gripht_check.gemspec",
     "lib/gripht.rb",
     "lib/gripht/app.rb",
     "lib/gripht/views/application.js",
     "lib/gripht/views/failed.haml",
     "lib/gripht/views/index.haml",
     "lib/gripht/views/layout.haml",
     "spec/fixtures.rb",
     "spec/gripht_spec.rb",
     "spec/spec_helper.rb"
  ]
  s.homepage = %q{http://github.com/jsmestad/gripht}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.3}
  s.summary = %q{TODO}
  s.test_files = [
    "spec/fixtures.rb",
     "spec/gripht_spec.rb",
     "spec/spec_helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<sinatra>, [">= 0.9.1.1"])
      s.add_runtime_dependency(%q<rubigen>, [">= 1.5.2"])
      s.add_runtime_dependency(%q<rack-test>, [">= 0.1.0"])
      s.add_runtime_dependency(%q<webrat>, [">= 0.4.3"])
      s.add_runtime_dependency(%q<fakeweb>, [">= 1.2.0"])
      s.add_runtime_dependency(%q<haml>, [">= 2.0.9"])
      s.add_runtime_dependency(%q<rest-client>, [">= 0.9.2"])
      s.add_runtime_dependency(%q<nokogiri>, [">= 0"])
    else
      s.add_dependency(%q<sinatra>, [">= 0.9.1.1"])
      s.add_dependency(%q<rubigen>, [">= 1.5.2"])
      s.add_dependency(%q<rack-test>, [">= 0.1.0"])
      s.add_dependency(%q<webrat>, [">= 0.4.3"])
      s.add_dependency(%q<fakeweb>, [">= 1.2.0"])
      s.add_dependency(%q<haml>, [">= 2.0.9"])
      s.add_dependency(%q<rest-client>, [">= 0.9.2"])
      s.add_dependency(%q<nokogiri>, [">= 0"])
    end
  else
    s.add_dependency(%q<sinatra>, [">= 0.9.1.1"])
    s.add_dependency(%q<rubigen>, [">= 1.5.2"])
    s.add_dependency(%q<rack-test>, [">= 0.1.0"])
    s.add_dependency(%q<webrat>, [">= 0.4.3"])
    s.add_dependency(%q<fakeweb>, [">= 1.2.0"])
    s.add_dependency(%q<haml>, [">= 2.0.9"])
    s.add_dependency(%q<rest-client>, [">= 0.9.2"])
    s.add_dependency(%q<nokogiri>, [">= 0"])
  end
end
