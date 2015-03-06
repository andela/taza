namespace :deploy do
  desc 'prod'
  task :prod, :branch do |t, args|
    args.with_defaults(:branch => "master")
     output = `git push heroku #{args[:branch]}:master`
    puts output
    process_status = $?
    exit_code = process_status.to_i
    raise "deploy failed" unless exit_code == 0
  end
end
