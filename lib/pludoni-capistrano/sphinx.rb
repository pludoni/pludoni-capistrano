
namespace :deploy do
  task :new_sphinx, :roles => [:app] do
    thinking_sphinx.stop
    run "ln -nfs #{shared_path}/db/sphinx #{release_path}/db/sphinx"
    thinking_sphinx.configure
    #thinking_sphinx.start
  end
end
require 'thinking_sphinx/deploy/capistrano'
after 'deploy:update_code', 'deploy:new_sphinx'
after 'deploy:update_code', 'thinking_sphinx:start'
