namespace :deploy do
  desc 'prod'
  task :prod, :branch do |t, args|
    args.prod(:branch => "master")
    output = `echo "rake task was passed branch: #{args}"`
    # output = `git push heroku master:master`
    puts output
    process_status = $?
    exit_code = process_status.to_i
    raise "deploy failed" unless exit_code == 0
  end
end

# task :with_defaults, :arg1, :arg2 do |t, args|
#   args.with_defaults(:arg1 => :default_1, :arg2 => :default_2)
#   puts "Args with defaults were: #{args}"
# end