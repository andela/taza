# CreateFixtures
class CreateFixtures
  def initialize(fbuilder_instance)
    @fbuilder_instance = fbuilder_instance
  end

  def create
    create_users
  end

  def create_users
    users = {
        debbie: FactoryGirl.create(
            :user,
            email: 'debbie@example.com',
            name: 'deborah enomah',
            image: 'https://image.jpg'
        ),
        chad: FactoryGirl.create(
            :user,
            email: 'chad@woolley.com',
            name: 'chad wolley'
        )
    }
    users.each do |fixture_name, user|
      @fbuilder_instance.name(fixture_name, user)
    end
  end
end
