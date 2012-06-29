require "pludoni-capistrano/setup"
Capistrano::Configuration.instance.load do
  after "deploy:update_code", :symlink_db
  after 'bundle:install', 'deploy:migrate'
  after "deploy:setup",   'db_setup'

  task :symlink_db do
    run "ln -nfs #{shared_path}/db/production.sqlite3 #{release_path}/db/production.sqlite3"
  end
  task :db_setup, :roles => [:app, :db, :web] do
    run <<-CMD
    touch #{shared_path}/db/production.sqlite3
    CMD
  end
end
