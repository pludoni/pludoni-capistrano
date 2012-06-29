Capistrano::Configuration.instance.load do
  folder = Dir.pwd
  set :repository, "file://#{folder}"
  set :local_repository, "file://."
  role :web, "localhost"                          # Your HTTP server, Apache/etc
  role :app, "localhost"                          # This may be the same as your `Web` server
  role :db,  "localhost", :primary => true # This is where Rails migrations will run
end
