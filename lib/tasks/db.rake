namespace :db do
  desc "Buids fixture builder on staging via its rebuild rake task"
  task :load_fixtures => ['spec:fixture_builder:rebuild', 'db:fixtures:load']
end