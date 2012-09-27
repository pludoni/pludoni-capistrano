Capistrano::Configuration.instance.load do

  require 'thinking_sphinx/deploy/capistrano'
  if ENV["SPHINX"] == "yes"
    namespace :deploy do
      task :new_sphinx, :roles => [:app] do
        thinking_sphinx.stop
        run "ln -nfs #{shared_path}/db/sphinx #{release_path}/db/sphinx"
        thinking_sphinx.configure
        #thinking_sphinx.start
      end
    end
    after 'deploy:update_code', 'deploy:new_sphinx'
    after 'deploy:update_code', 'thinking_sphinx:start'
    after 'deploy:setup',   'thininking_sphinx:setup'
  else
    namespace :deploy do
      task :new_sphinx, :roles => [:app] do
        run "ln -nfs #{shared_path}/db/sphinx #{release_path}/db/sphinx"
      end
    end
    after 'deploy:update_code', 'deploy:new_sphinx'
    after 'deploy:update_code', 'thinking_sphinx:configure'
    after 'deploy:update_code', 'thinking_sphinx:index'
  end
end
