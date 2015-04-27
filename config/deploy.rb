require 'capistrano-rbenv'
load 'deploy/assets'
SSH_USER = 'root'
ssh_options[:port] = 22222
set :rake, "bundle exec rake"
set :application, "zhangyu blog"
set :repository, "."
set :scm, :none
set :deploy_via, :copy
server = "106.185.52.66"
set :deploy_to, "/opt/app/zhangyu"

role :web, server
role :app, server
role :db,  server, :primary => true
role :db,  server

default_run_options[:pty] = true


set :user, SSH_USER

namespace :deploy do
  task :start do
    run "cd #{release_path} && bundle exec thin start -C config/thin.yml"
  end
  task :stop do
    run "cd #{release_path} && bundle exec thin stop -C config/thin.yml"
  end
  task :restart, :roles => :app, :except => { :no_release => true } do
    db_migrate
    stop
    sleep 2
    start
  end
  task :db_migrate do
    run "cd #{release_path} && bundle install"
    run "cd #{release_path} && bundle exec rake db:create && bundle exec rake db:migrate RAILS_ENV=production"
  end

  namespace :assets do
    task :precompile do

    end
  end
end


desc "Copy database.yml to release_path"
task :cp_database_yml do
  puts "=== executing my customized command: "
  run "cp -r  #{release_path}/config/ #{shared_path}/config/*"
  run "ln -s #{shared_path}/files #{release_path}/public/files "
  run "rm #{release_path}/public/uploads -rf"
  run "ln -s #{shared_path}/public/uploads #{release_path}/public/uploads"
  puts "=== done (executing my customized command)"
end

before "deploy:assets:precompile", :cp_database_yml
#after "deploy", "deploy:restart"# config valid only for current version of Capistrano
#lock '3.3.5'
