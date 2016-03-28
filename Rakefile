# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)
  task networth_snapshot: :environment do
    User.all.each do |user|
      @entry = NetWorthProgress.new
      @entry.user_id     = user.net_worth.user_id
      @entry.assets      = user.net_worth.sum_assets
      @entry.liabilities = user.net_worth.sum_liabilities
      @entry.networth    = user.net_worth.calc_networth
      @entry.save
    end
  end
Rails.application.load_tasks
