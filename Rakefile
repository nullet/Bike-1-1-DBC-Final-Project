# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.
require "fileutils"

begin
  require "bundle/setup"
rescue LoadError
  puts "You must 'gem install bundler' and 'bundle install' to run rake tasks"
end

require File.expand_path('../config/application', __FILE__)

Rails.application.load_tasks
