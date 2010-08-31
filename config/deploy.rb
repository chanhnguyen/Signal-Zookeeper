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

set :scm, :none
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

set :deploy_via, :copy
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
    puts "**Restarted"
  end
end
