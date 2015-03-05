require_relative 'create_fixtures'

FixtureBuilder.configure do |fbuilder|
  # rebuild fixtures automatically when these files change:
  fbuilder.files_to_check += Dir[
      'spec/factories.rb',
      'spec/support/create_fixtures.rb',
      'spec/support/fixture_builder.rb'
  ]

  # now declare objects
  fbuilder.factory do |fbuilder_instance|
    CreateFixtures.new(fbuilder_instance).create
  end
end