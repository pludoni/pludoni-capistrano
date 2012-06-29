Capistrano::Configuration.instance.load do

  set :mkdirs, %w[system db log]   unless exists?(:mkdirs)
  task :folder_setup, :roles => [:app, :db, :web] do
    paths = mkdirs.map{|i| "#{shared_path}/#{i}"}.join(" ")
    run <<-CMD
      mkdir -p -m 775 #{release_path} #{paths}
    CMD
  end
  after "deploy:setup", "folder_setup"

end
