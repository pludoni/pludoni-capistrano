set :test_log, "log/capistrano.test.log"
namespace :deploy do
  before 'deploy:update_code' do
    puts "--> Running tests, please wait ..."
    unless system "bundle exec rspec > #{test_log} 2>&1" #' > /dev/null'
      puts "--> Tests failed. Run `cat #{test_log}` to see what went wrong."
      exit
    else
      puts "--> Tests passed"
      system "rm #{test_log}"
    end
  end
end
