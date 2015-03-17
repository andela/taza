# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

theteam = TheTeam.create ([{
                               name: 'Jeremy Johnson',
                               position: 'Co-Founder and CEO',
                               image: 'jeremy.jpg',
                               bio: 'Prior to founding Andela, Jeremy co-founded 2U and served in a succession of roles (Chief Technology Officer, Chief Marketing Officer, and Chief Strategy Officer) between 2008 and 2014 as the company grew to over 700 people. One of the fastest growing education technology startups in history, 2U went public on March 28th, 2014, and continues to transform higher online programs.Jeremy is recognized broadly for his work at 2U as an education innovator as well as a champion of youth entrepreneurship. His speaking appearances include the White House, Congress, and conferences and college campuses around the world as well as major media outlets like NBC, ABC, FOX, and CNBC. Jeremy was named “30 Under 30” by Inc. Magazine in 2012 and Forbes in 2013 and 2014. Outside of Andela, Jeremy serves on the board of the Young Entrepreneur Council and the education non-profit PENCIL and co-authored a book, Education & Skills 2.0: New Targets & Innovative Approaches, for the World Economic Forum.'
                           }, {
                               name: 'Christina Sass',
                               position: 'Co-Founder and COO',
                               image: 'christina.jpg',
                               bio: 'Christina Sass began building education programs in her home state of Georgia and has since started schools and youth programs in the U.S., China, The Palestinian Territories, Kenya, and Nigeria.While directing the Program Department at The Clinton Global Initiative, she worked closely with President Clinton and his office to design and execute the annual CGI agenda. This involved driving Commitments to Action with corporations, NGOs, governments and philanthropies with a particular focus on scalable education solutions and empowerment of girls and women in developing countries. She then served as an advisor to the President and CEO of The MasterCard Foundation on fostering collaboration among partners. The MasterCard Foundation is a global foundation with over $9 billion in assets working to advance youth learning and financial inclusion for youth in Africa.In co-founding Andela, Christina has finally found a scalable way for bright but disadvantaged young people to receive training and employment without any debt and without leaving their home countries. She believes this model has the power to both close global labor gaps and launch lifelong careers for thousands of young people.Christina has a Bachelor’s degree in Ancient Philosophy from the University of Georgia (Go Dawgs) and a Master’s degree in International Law and Diplomacy from The Fletcher School at Tufts University.'
                           }, {
                               name: 'Obie Fernandez',
                               position: 'CTO',
                               image: 'obie.jpg',
                               bio: 'Obie brings a depth of skill and experience to the Andela team in the areas of software craftsmanship, people and business development. He is known all over the tech world as one of the top evangelists for Ruby on Rails and the books in his Addison Wesley Professional Ruby Series are some of the "bibles" of Ruby development. Obie has over 20 years of professional experience delivering high-quality software and still slings code everyday, most recently diving head first into the "FAN" stack, which he says promises 10x productivity over Rails by combining Firebase + Angular + Node.js. Prior to joining the Andela team, Obie has founded a variety of product-driven and consulting startups, most famously his agency Hashrocket, which he sold in 2010. During his tenure at ThoughtWorks during the 2000s, Obie was a thought leader in Agile project development, and delivered some of the first production Ruby applications for Fortune 100 companies all over the world.'
                           }, {
                               name: 'Ian Carnevale',
                               position: 'Co-Founder and Director, Business Systems',
                               image: 'ian.jpg',
                               bio: 'Ian has spent the past six years building education technology companies. Prior to Andela, he co-founded two startups, LearnVille and Fora, which was accepted into Canada’s top accelerator, Extreme Startups. At Fora, Ian connected over 800 students across Africa to online courses. Ian is currently a mentor for Techstars, one of the top startup accelerators in the world, where he brings his immense experience leading technical and business teams and building digital products, including three Learning Management Systems.Ian has a background in Computer Science and Digital Enterprise Management from the University of Toronto as well as Visual Design from Sheridan College. His passion for user experience coupled with his desire to help people succeed drives his vision of shaping the world through education.'
                           }])
