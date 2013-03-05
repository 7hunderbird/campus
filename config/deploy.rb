require 'bundler/capistrano'
require './config/boot'
require 'airbrake/capistrano'

# load 'deploy/assets'            # uncomment if manually precompile assets
load 'config/application'         # load application config values from application.yml

# data dog
require "capistrano/datadog"
set :datadog_api_key, APP_CONFIG[:datadog_api_key]

# Application Settings
set :application,   "campus"
set :user,          APP_CONFIG[:deploy_user]
set :password,      APP_CONFIG[:deploy_password]
set :deploy_to,     "/home/#{user}/#{application}"
set :rails_env,     "production"
set :use_sudo,      true
set :keep_releases, 5

# Git Settings
set :scm,           :git
set :branch,        "master"
set :repository,    "git@github.com:rubycommcollege/campus.git"
set :deploy_via,    :remote_cache

# Uses local instead of remote server keys, good for github ssh key deploy.
ssh_options[:forward_agent] = true
default_run_options[:pty] = true

# Server Roles
role :web, "173.255.241.215"
role :app, "173.255.241.215"
role :db,  "173.255.241.215", :primary => true

after "deploy", "deploy:cleanup" # keep only the last 5 releases

namespace :deploy do
  %w[start stop restart].each do |command|
    desc "#{command} unicorn server"
    task command, roles: :app, except: {no_release: true} do
      run "/etc/init.d/unicorn_#{application} #{command}"
    end
  end

  task :setup_config, roles: :app do
    sudo "ln -nfs #{current_path}/config/nginx.conf /etc/nginx/sites-enabled/#{application}"
    sudo "ln -nfs #{current_path}/config/unicorn_init.sh /etc/init.d/unicorn_#{application}"
    run "mkdir -p #{shared_path}/config"
    put File.read("config/examples/application.yml"), "#{shared_path}/config/application.yml"
    put File.read("config/examples/database.yml.postgresql"), "#{shared_path}/config/database.yml"
    puts "\nTODO: Now edit the config files in #{shared_path}.\n"
  end
  after "deploy:setup", "deploy:setup_config"

  task :symlink_config, roles: :app do
    run "ln -nfs #{shared_path}/config/application.yml #{release_path}/config/application.yml"
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
  end
  after "deploy:finalize_update", "deploy:symlink_config"

  # desc "Make sure local git is in sync with remote."
  # task :check_revision, roles: :web do
  #   unless `git rev-parse HEAD` == `git rev-parse origin/master`
  #     puts "WARNING: HEAD is not the same as origin/master"
  #     puts "Run `git push` to sync changes."
  #     exit
  #   end
  # end
  # before "deploy", "deploy:check_revision"
end

# compile assets locally, requires a production db to be configured locally
namespace :deploy do
  namespace :assets do
    desc "Precompile assets on local machine and upload them to the server."
    task :precompile, roles: :web, except: {no_release: true} do
      run_locally "bundle exec rake assets:precompile"
      find_servers_for_task(current_task).each do |server|
        run_locally "rsync -vr --exclude='.DS_Store' public/assets #{user}@#{server.host}:#{shared_path}/"
      end
    end
  end
end

# Deploys your current application.yml file
namespace :deploy do
  desc "Deploys config file" 
  task :app_config do
    put File.read("config/application.yml"), "#{shared_path}/config/application.yml"
  end
end
