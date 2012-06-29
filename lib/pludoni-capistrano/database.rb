
after "deploy:update_code", :symlink_db
after 'bundle:install', 'deploy:migrate'

task :symlink_db do
  run "ln -nfs #{shared_path}/db/production.sqlite3 #{release_path}/db/production.sqlite3"
end
task :setup, :roles => [:app, :db, :web] do
  run <<-CMD
    mkdir -p -m 775 #{release_path} #{shared_path}/system #{shared_path}/db &&
    mkdir -p -m 777 #{shared_path}/log &&
    touch #{shared_path}/db/production.sqlite3
  CMD
end
