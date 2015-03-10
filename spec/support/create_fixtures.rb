# CreateFixtures
class CreateFixtures
  def initialize(fbuilder_instance)
    @fbuilder_instance = fbuilder_instance
  end

  def create
    create_users
    create_team_members
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

  def create_team_members
    team_members = {
        jeremy: FactoryGirl.create(
            :team_member,
            name: 'Jeremy Johnson',
            position: 'Co-Founder and CEO',
            image: 'jeremy.jpg',
            bio: "Prior to founding Andela, Jeremy co-founded 2U, one of the fastest growing education technology startups in history. 2U went public in 2014 (NASDAQ:TWOU) and continues to transform higher education by delivering the world's best online degree programs with top tier universities. Jeremy is recognized broadly for his work as an education innovator. He has spoken on education and entrepreneurship at meetings hosted by the White house and Congress. His speaking appearances include conferences and college campuses around the world as well as media outlets like NBC, ABC, FOX, and CNBC. Jeremy was named “30 Under 30” by Inc. Magazine in 2012 and Forbes in 2013 and 2014. Outside of Andela, Jeremy serves on the board of the Young Entrepreneur Council and the education non-profit PENCIL and co-authored a book for the World Economic Forum: 'Education & Skills 2.0: New Targets & Innovative Approaches'"
      ),
        christina: FactoryGirl.create(
            :team_member,
            name: 'Christina Sass',
            position: 'Co-Founder and COO',
            image: 'christina.jpg',
            bio: 'Christina Sass began building education programs in her home state of Georgia and has since started schools and youth programs in the U.S., China, The Palestinian Territories, Kenya, and Nigeria.While directing the Program Department at The Clinton Global Initiative, she worked closely with President Clinton and his office to design and execute the annual CGI agenda. This involved driving Commitments to Action with corporations, NGOs, governments and philanthropies with a particular focus on scalable education solutions and empowerment of girls and women in developing countries. She then served as an advisor to the President and CEO of The MasterCard Foundation on fostering collaboration among partners. The MasterCard Foundation is a global foundation with over $9 billion in assets working to advance youth learning and financial inclusion for youth in Africa.In co-founding Andela, Christina has finally found a scalable way for bright but disadvantaged young people to receive training and employment without any debt and without leaving their home countries. She believes this model has the power to both close global labor gaps and launch lifelong careers for thousands of young people.Christina has a Bachelor’s degree in Ancient Philosophy from the University of Georgia (Go Dawgs) and a Master’s degree in International Law and Diplomacy from The Fletcher School at Tufts University.'
        ),
        obie: FactoryGirl.create(
            :team_member,
            name: 'Obie Fernandez',
            position: 'CTO',
            image: 'obie.jpg',
            bio: 'Obie brings a depth of skill and experience to the Andela team in the areas of software craftsmanship, people and business development. He is known all over the tech world as one of the top evangelists for Ruby on Rails and the books in his Addison Wesley Professional Ruby Series are some of the "bibles" of Ruby development. Obie has over 20 years of professional experience delivering high-quality software and still slings code everyday, most recently diving head first into the "FAN" stack, which he says promises 10x productivity over Rails by combining Firebase + Angular + Node.js. Prior to joining the Andela team, Obie has founded a variety of product-driven and consulting startups, most famously his agency Hashrocket, which he sold in 2010. During his tenure at ThoughtWorks during the 2000s, Obie was a thought leader in Agile project development, and delivered some of the first production Ruby applications for Fortune 100 companies all over the world.'
        ),
        ian: FactoryGirl.create(
            :team_member,
            name: 'Ian Carnevale',
            position: 'Co-Founder and Director, Business Systems',
            image: 'ian.jpg',
            bio: 'Ian has spent the past six years building education technology companies. Prior to Andela, he co-founded two startups, LearnVille and Fora, which was accepted into Canada’s top accelerator, Extreme Startups. At Fora, Ian connected over 800 students across Africa to online courses. Ian is currently a mentor for Techstars, one of the top startup accelerators in the world, where he brings his immense experience leading technical and business teams and building digital products, including three Learning Management Systems.Ian has a background in Computer Science and Digital Enterprise Management from the University of Toronto as well as Visual Design from Sheridan College. His passion for user experience coupled with his desire to help people succeed drives his vision of shaping the world through education.'
        )
    }
    team_members.each do |fixture_name, team_member|
      @fbuilder_instance.name(fixture_name, team_member)
    end
  end
end
