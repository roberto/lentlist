require 'bundler/capistrano'
#require 'fast_git_deploy/enable'

server "lentlist.test", :web, :app, :db, primary: true

default_run_options[:pty] = true
ssh_options[:forward_agent] = true

set :application, "lentlist"
set :repository,  "git://github.com/roberto/lentlist.git"

set :user, "vagrant"
set :deploy_type, "deploy"
set :branch, "master"
set :use_sudo, false


after "deploy:setup" do
  #deploy.fast_git_setup.clone_repository
  run "cd #{current_path} && bundle install"
end

namespace :unicorn do
  desc "Start unicorn for this app"
  task :start do
    run "cd #{current_path} && bundle exec unicorn -c /etc/unicorn/lentlist.conf.rb -D"
  end
end

namespace :deploy do
  task :create_symlink do
  end
end
