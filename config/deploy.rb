require "bundler/capistrano"

load "config/recipes/base"
load "config/recipes/nginx"
load "config/recipes/unicorn"
load "config/recipes/mysql"
load "config/recipes/rbenv"
load "config/recipes/check"
load "config/recipes/nodejs"

server "74.208.90.50", :web, :app, :db, primary: true

set :domain, 'sian.com'
set :user, "root"
set :application, "sian"
set :deploy_to, "/var/www/applications/#{application}"
set :deploy_via, :remote_cache
set :use_sudo, false

set :scm, "git"
set :repository, "git@github.com:juandel/sian.git"
set :branch, "master"
set :keep_releases, 2

default_run_options[:pty] = true

desc "Zero-downtime restart of Unicorn"
task :restart, :except => { :no_release => true } do
  run "kill -s USR2 `cat /tmp/unicorn.my_site.pid`"
end

desc "Start unicorn"
task :start, :except => { :no_release => true } do
  run "cd #{current_path} ; bundle exec unicorn_rails -c config/unicorn.rb -D"
end

desc "Stop unicorn"
task :stop, :except => { :no_release => true } do
  run "kill -s QUIT `cat /tmp/unicorn.my_site.pid`"
end

ssh_options[:forward_agent] = true

after "deploy", "deploy:cleanup" # keep only the last 5 releases
