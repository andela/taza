namespace :db do
  desc "Drop and recreates the database and forces the run of fixture builder via its rebuild rake task"
  task :bootstrap => ['db:drop:all', 'db:create:all', 'db:migrate', 'db:fixtures:load']

  namespace :fixtures do
    desc "Load fixtures (from spec/fixtures) into the current environment's database."
    task :load => :environment do
      require 'active_record/fixtures'
      ActiveRecord::Base.establish_connection(Rails.env)
      base_dir = File.join(Rails.root, 'spec', 'fixtures')
      fixtures_dir = ENV['FIXTURES_DIR'] ? File.join(base_dir, ENV['FIXTURES_DIR']) : base_dir
      (ENV['FIXTURES'] ? ENV['FIXTURES'].split(/,/).map {|f| File.join(fixtures_dir, f) } : Dir.glob(File.join(fixtures_dir, '*.{yml,csv}'))).each do |fixture_file|
        ActiveRecord::Fixtures.create_fixtures('spec/fixtures', File.basename(fixture_file, '.*'))
      end
    end
  end
end;