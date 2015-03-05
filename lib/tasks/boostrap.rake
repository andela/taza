namespace :db do
  desc "Drop and recreates the database and forces the run of fixture builder via its rebuild rake task"
  task :bootstrap => ['db:drop:all', 'db:create:all', 'db:migrate', 'db:fixture']

  desc "Bootstrap the database with fixtures from spec/fixtures."
  task :fixture => :environment do
    require 'active_record/fixtures'
    fixtures_dir = File.join(Rails.root, '/spec/fixtures')
    Dir.glob(File.join(fixtures_dir,'*.yml')).each do |file|
      base_name = File.basename(file, '.*')
      ActiveRecord::Fixtures.create_fixtures(fixtures_dir, base_name)
    end
  end
end