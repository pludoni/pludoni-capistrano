Capistrano::Configuration.instance.load do
  require 'bundler/capistrano'

  before 'deploy:setup', 'rvm:install_rvm'   # install RVM
  before 'deploy:setup', 'rvm:install_ruby'  # install Ruby and create gemset, or:
  set :rvm_type, :user

  set :rvm_ruby_string, ENV['GEM_HOME'].gsub(/.*\//,"")  if !exists?(:rvm_ruby_string)
  require "rvm/capistrano"

end
