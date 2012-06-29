require 'capistrano_colors'
# Add RVM's lib directory to the load  ...path.
#$:.unshift("#{ENV["HOME"]}/.rvm/lib")
#$:.unshift(File.expand_path('./lib', ENV['rvm_path']))
Capistrano::Configuration.instance.load do
  set :use_sudo, false
  after "deploy", "deploy:cleanup"
end
