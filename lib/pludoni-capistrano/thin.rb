namespace :thin do
  desc "Start the Thin processes"
  task :start do
    run  <<-CMD
      cd #{current_path}; bundle exec thin start -C config/thin.yml
    CMD
  end
  desc "Stop the Thin processes"
  task :stop do
    run <<-CMD
      cd #{current_path}; bundle exec thin stop -C config/thin.yml
    CMD
  end
  desc "Restart the Thin processes"
  task :restart do
    run <<-CMD
      cd #{current_path}; bundle exec thin restart -C config/thin.yml
    CMD
  end

end
after 'deploy', "thin:restart"
