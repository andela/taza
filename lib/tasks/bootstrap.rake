namespace :db do
  desc "Drop and recreates the database and forces the run of fixture builder via its rebuild rake task"
  task :bootstrap => ['db:drop:all', 'db:create:all', 'db:migrate', 'db:test:prepare']
end