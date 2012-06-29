require 'bundler/capistrano'
$:.unshift(File.expand_path('./lib', ENV['rvm_path'])) # Add RVM's lib directory to the load  ...path.
require "rvm/capistrano"                  # Load RVM's capistrano plugin.
require 'capistrano_colors'

set :scm, :git
