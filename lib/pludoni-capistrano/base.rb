require 'bundler/capistrano'
# Add RVM's lib directory to the load  ...path.
$:.unshift(File.expand_path('./lib', ENV['rvm_path']))
require "rvm/capistrano"                  # Load RVM's capistrano plugin.
require 'capistrano_colors'

