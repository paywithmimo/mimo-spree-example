require './config/boot'

require 'capistrano/ext/multistage'
require 'bundler/capistrano'
require 'rvm/capistrano'

ssh_options[:forward_agent] = true

set :normalize_asset_timestamps, false
set :rvm_ruby_string, 'ruby-1.9.3-p125@MIMO-Spree-Example'
default_run_options[:pty] = true

set :keep_releases,         5
set :default_stage,         "staging"
set :rvm_type,              :user

set :application,           "mimo-spree-example"
set :deploy_to,             proc { "/var/projects/#{application}/#{stage}" }
set :user,                  'mimo'
set :scm,                   :git
set :scm_verbose,           true
set :deploy_via,            :remote_cache
set :repository,            "git@github.com:paywithmimo/mimo-spree-example.git"
set :branch,                "master"
set :runner,                user

set :use_sudo,              false

namespace :deploy do
  desc "Link in the configuration files"
  task :symlink_configs, :except => { :no_release => true } do
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
  end

  desc "Link spree folder"
  task :link_spree_folder, :except => { :no_release => true } do
    run "ln -s #{shared_path}/spree/ #{release_path}/public/spree"
  end

  desc "Restart Apache"
  task :restart, roles:  :app, except:  { no_release:  true } do
    run "touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end

before "deploy:assets:precompile", "deploy:symlink_configs"
after "deploy:assets:precompile", "deploy:link_spree_folder"
