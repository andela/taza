namespace :admin do
  task :initializer => :environment do
    admin_initializer = AdminInitializer.new
    admin_initializer.grant_admin_access
  end
end