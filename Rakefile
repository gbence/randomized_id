require 'rake'
require 'rake/rdoctask'
require 'rake/gempackagetask'

#desc 'Default: run unit tests.'
#task :default => :test

desc 'Generate documentation for the randomized_id plugin.'
Rake::RDocTask.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'RandomizedID'
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.rdoc_files.include('README')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

PKG_FILES = FileList[
  '[a-zA-Z]*',
  'generators/**/*',
  'lib/**/*',
  'rails/**/*',
  'tasks/**/*',
  'test/**/*'
]

spec = Gem::Specification.new do |s|
  s.name = "randomized_id"
  s.version = "0.0.1"
  s.author = "Bence Golda"
  s.email = "golda@bitandpixel.hu"
  s.homepage = "http://bitandpixel.hu/"
  s.platform = Gem::Platform::RUBY
  s.summary = "Random id generator for ActiveModel and co."
  s.files = PKG_FILES.to_a
  s.require_path = "lib"
  s.has_rdoc = false
  s.extra_rdoc_files = ["README"]
end

desc "Turn this plugin into a gem."
Rake::GemPackageTask.new(spec) do |pkg|
  pkg.gem_spec = spec
end
