#
# Deploy script
#

#========================
# CONFIG
#========================

set :application, "zookeeper"
set :use_sudo, false
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

set :deploy_to, "#{application}/#{stage}"
set :domain, "cnguyen-md"
# ssh_options[:forward_agent] = true

#========================
# ROLES
#========================
role :node, "cnguyen-md", "hyan-md"
role :db, domain, :primary => true
#========================
# CUSTOM
#========================

set :data_dir, "/zookeeper/data/"


namespace :deploy do

  task :start, :roles => :node do
    puts "**Start"
    puts "**Creating zookeeper data directory"
    run "mkdir -p #{data_dir}"
  end

  task :stop, :roles => :node do
    puts "**Stop"
    run "cd #{current_release}; sh bin/zkServer.sh stop"
  end

  desc "Restart Application"
  task :restart, :roles => :node do
    puts "**Restarted zookeeper"
    run "cd #{current_release}; sh bin/zkServer.sh start"
  end
  
  task :migrate, :roles => :node do
    puts "**DUMMY Migrate"
  end
    
  
  
end
