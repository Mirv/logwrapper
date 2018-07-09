require "bundler/gem_tasks"
require "rake/testtask"

Rake::TestTask.new(:test) do |t|
  t.libs << "test"
  t.libs << "lib"
  t.test_files = FileList["test/**/*_test.rb"]
end

desc 'Touch this thing'
task :putter do
  # load 'logwrapper.rb'
  puts "-----------------"

  # Dir["#{File.dirname(__FILE__)}/lib/**/*.rb"].each { |f| load(f) }
  # puts Dir.pwd

  # Logwrapper.hi
end

task :default => :test
