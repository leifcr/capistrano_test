# config valid only for current version of Capistrano
lock '3.4.0'

set :application, 'capistrano_test'
set :user, 'deploy'
set :repo_url, 'git@github.com:leifcr/capistrano_test.git'
set :stage, 'production'

set :rvm1_ruby_version, '2.2.1@capistrano'
# set :bundle_dir, ''
set :bundle_path, nil
set :bundle_flags, ''

# set :rvm_require_role, :app
# require "rvm/capistrano/selector_mixed"
# set :rvm_type, :system

set :server_name, 'localhost'

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, '/var/www/my_app_name'

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
set :pty, true # Must be enabled for sudo'ing

before :deploy, :check, :linked_files do
  on roles(:app) do
    execute :mkdir, "-p #{shared_path.join('pids')}" if test ("[ ! -d #{shared_path.join('db')} ]") # rubocop:disable Metrics/LineLength
    if test "[ ! -d #{shared_path.join('db')} ]"
      execute :mkdir, "-p #{shared_path.join('db')}"
    end
    if test ("[ ! -f #{shared_path.join('db', 'production.sqlite3')} ]")
      execute :touch, shared_path.join('db', 'production.sqlite3')
    end
  end
end

# Default value for :linked_files is []
set :linked_files, fetch(:linked_files, []).push('db/production.sqlite3')

# Default value for linked_dirs is []
# set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'vendor/bundle')

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5

namespace :deploy do
  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end
end

before 'deploy:updating', 'monit:unmonitor'
before 'deploy:updating', 'delayed_job:runit:stop'

before 'deploy:publishing', 'puma:runit:stop'
after 'deploy:published', 'puma:runit:start'
after 'deploy:published', 'delayed_job:runit:start'

after 'deploy:finished', 'monit:monitor'
