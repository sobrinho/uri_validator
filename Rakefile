require 'bundler'
require 'rake'
require 'rake/testtask'

task :default => [:test_units]

Rake::TestTask.new("test") { |t|
  t.pattern = 'test/**/*_test.rb'
  t.verbose = true
  t.warning = true
}

Bundler::GemHelper.install_tasks
