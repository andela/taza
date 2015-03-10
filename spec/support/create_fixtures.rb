# CreateFixtures
class CreateFixtures
  def initialize(fbuilder_instance)
    @fbuilder_instance = fbuilder_instance
  end

  def create
    create_users
    create_the_teams
  end

  def create_users
    users = {
        debbie: FactoryGirl.create(
            :user,
            email: 'debbie@example.com',
            name: 'deborah enomah',
            image: 'https://image1.jpg'
        ),
        chad: FactoryGirl.create(
            :user,
            email: 'chad@woolley.com',
            name: 'chad wolley',
            image: 'https://image2.jpg'
        )
    }
    users.each do |fixture_name, user|
      @fbuilder_instance.name(fixture_name, user)
    end
  end

  def create_the_teams
    the_teams = {
        obie: FactoryGirl.create(
            :the_team,
            name: 'obie',
            position: 'CTO',
            bio: 'bio'
      )
    }
    the_teams.each do |fixture_name, the_team|
      @fbuilder_instance.name(fixture_name, the_team)
    end
  end
end
