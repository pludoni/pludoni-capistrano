Capistrano::Configuration.instance.load do
  set :rails_env, "production" #added for delayed job
  require "delayed/recipes"
  set :delayed_job_args, "-n 1"
  after "deploy:stop",    "delayed_job:stop"
  after "deploy:start",   "delayed_job:start"
  after "deploy:restart", "delayed_job:restart"
end
