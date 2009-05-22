require 'rubygems'
require 'rake'
require 'spec/rake/spectask'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "gripht"
    gem.summary = %Q{TODO}
    gem.email = "justin.smestad@gmail.com"
    gem.homepage = "http://github.com/jsmestad/gripht"
    gem.authors = ["Justin Smestad"]
    # gem is a Gem::Specification... see http://www.rubygems.org/read/chapter/20 for additional settings

    gem.add_dependency "sinatra", ">= 0.9.1.1"
    gem.add_dependency "rubigen", ">= 1.5.2"
    gem.add_dependency "rack-test", ">= 0.1.0"
    gem.add_dependency "webrat", ">= 0.4.3"
    gem.add_dependency "fakeweb", ">= 1.2.0"
    gem.add_dependency 'haml', ">= 2.0.9"
    gem.add_dependency 'rest-client', ">= 0.9.2"
    gem.add_dependency 'nokogiri'
  end

rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: sudo gem install jeweler"
end

task :default => :spec

desc "Run specs"
Spec::Rake::SpecTask.new(:spec) do |t|
  t.spec_files = FileList['spec/**/*_spec.rb']
  t.spec_opts = %w(-fs --color)
  t.spec_opts << '--loadby' << 'random'

  t.rcov_opts << '--exclude' << 'spec'
  t.rcov = ENV.has_key?('NO_RCOV') ? ENV['NO_RCOV'] != 'true' : true
  t.rcov_opts << '--text-summary'
  t.rcov_opts << '--sort' << 'coverage' << '--sort-reverse'
end
