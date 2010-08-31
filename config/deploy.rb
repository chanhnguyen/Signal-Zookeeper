#
# Deploy script
#

#========================
# CONFIG
#========================

set :application, "zookeeper"
set :use_sudo, false
set :runner, "cnguyen"
set :stage, :production


set :repository, "git@github.com:chanhnguyen/Signal-Zookeeper.git"
set :branch, "master"
set :ssh_options, { :forward_agent => true }
set :user, "cnguyen"
set :runner, "cnguyen"


set :scm, :git
set :scm_command, "/usr/local/git/bin/git"

# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

set :deploy_via, :remote_cache
set :copy_strategy, :export
set :copy_cache, true

set :deploy_to, "/opt/apps/#{application}"
set :domain, "cnguyen-md.linkedin.biz"
# ssh_options[:forward_agent] = true

#========================
# ROLES
#========================
role :node, domain

#========================
# CUSTOM
#========================
namespace :deploy do

  task :start, :roles => :node do
    puts "**Start"
  end

  task :stop, :roles => :node do
    puts "**Stop"
  end

  desc "Restart Application"
  task :restart, :roles => :node do
    puts "**Restarted zookeeper"
    run "cd #{current_release}; sh bin/zkServer.sh start"
  end
end
