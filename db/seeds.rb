require 'faker'

puts 'Destroying seeds...'
Vote.destroy_all
Candidature.destroy_all
Election.destroy_all
User.destroy_all
EligibleVoter.destroy_all


puts 'Creating user seeds'

admin = User.create(
 first_name: 'Admin',
 last_name: 'Admin',
 email: 'admin@gmail.com',
 password: 'password',
 admin: true
 )

gus = User.create(
  first_name: 'Gus',
  last_name: 'DeVita',
  email: 'gus@lewagon.com',
  password: 'password')
jim = User.create(
  first_name: 'Jim',
  last_name: 'James',
  email: 'jimjames@gmail.com',
  password: 'password')
rebecca = User.create(
  first_name: 'Rebecca',
  last_name: 'Green',
  email: 'rebecca@gmail.com',
  password: 'password')
julia = User.create(
  first_name: 'Julia',
  last_name: 'Shelley',
  email: 'julia@gmail.com',
  password: 'password')
pontus = User.create(
  first_name: 'Pontus',
  last_name: 'Nordbrandt',
  email: 'pontus@gmail.com',
  password: 'password')
jordi = User.create(
  first_name: 'Jordi',
  last_name: 'Gramunt',
  email: 'jordi@gmail.com',
  password: 'password')
chris = User.create(
  first_name: 'Chris',
  last_name: 'Beltran',
  email: 'chris@gmail.com',
  password: 'password')
dre = User.create(
  first_name: 'Dre',
  last_name: 'Dre',
  email: 'dre@gmail.com',
  password: 'password')
jen = User.create(
  first_name: 'Jennifer',
  last_name: 'Louise',
  email: 'jen@gmail.com',
  password: 'password')
tori = User.create(
  first_name: "Tori",
  last_name: "Susann",
  email: "tori@gmail.com",
  password: 'password')
minizozzo = User.create(
  first_name: "Mini",
  last_name: "Zozzo",
  email: "minizozzo@gmail.com",
  password: "password")
ruby = User.create(
  first_name: "Ruby",
  last_name: "Parrot",
  email: "ruby@gmail.com",
  password: "password")
python = User.create(
  first_name: "Python",
  last_name: "Snake",
  email: "python@gmail.com",
  password: "password")
avalon = User.create(
  first_name: "Avalon",
  last_name: "Van Der Host",
  email: "avalon@gmail.com",
  password: "password")
judy = User.create(
  first_name: "Judy",
  last_name: "Appleby",
  email: "judy@gmail.com",
  password: "password")
rob = User.create(
  first_name: "Rob",
  last_name: "Merz",
  email: "rob@gmail.com",
  password: "password")


100.times do |user|
 user = User.new(first_name: Faker::Artist.name, last_name: Faker::Artist.name, password: 'password')
 user.email = "#{user.first_name}@gmail.com"
 user.save
end

puts 'Creating election seeds...'
# le_wagon_pet = Election.create(
#   name: 'Le Wagon new pet',
#   user_id: User.all.last.id,
#   description: "Our beloved Zozzo needs a friend. Who should it be?",
#   dates: "#{DateTime.yesterday - 3.day} to #{DateTime.yesterday - 1.day}")


le_wagon_band = Election.create(
  name: 'Le Wagon Band President election',
  user_id: gus.id,
  description: "Devs need a soundtrack to their code. We need a leader to organize weekly band rehearsals and performances.  🎤🎸🥁🎶",
  dates: "#{DateTime.yesterday} to #{DateTime.tomorrow}",
  voting_start_date: DateTime.yesterday,
  voting_end_date: DateTime.tomorrow)

le_wagon_pet = Election.create(
  name: 'Le Wagon new pet',
  user_id: gus.id,
  description: "Our beloved Zozzo needs a friend. Who should it be?",
  dates: "#{DateTime.yesterday - 3.day} to #{DateTime.yesterday - 1.day}",
  voting_start_date: DateTime.yesterday - 3.day,
  voting_end_date: DateTime.yesterday - 1.day)

le_wagon_community_manager = Election.create(
  name: 'Le Wagon Community Manager',
  user_id: gus.id,
  description: "Vote for a special person who can turn Le Wagon BCN into an even greater community than it is today",
  dates: "#{DateTime.yesterday - 500.day} to #{DateTime.yesterday - 480.day}",
  voting_start_date: DateTime.yesterday - 500.day,
  voting_end_date: DateTime.yesterday - 480.day
  )


puts 'Creating eligible voters...'

User.all.each do |eligiblevoter|
  EligibleVoter.create(
    election_id: le_wagon_band.id,
    user_id: eligiblevoter.id
    )
end

User.all.each do |eligiblevoter|
  EligibleVoter.create(
    election_id: le_wagon_pet.id,
    user_id: eligiblevoter.id
    )
end

User.all.each do |eligiblevoter|
  EligibleVoter.create(
    election_id: le_wagon_community_manager.id,
    user_id: eligiblevoter.id)
end

puts 'Creating candidatures seeds...'

band1 = Candidature.create(
  name: 'Dre Leroy-Beaulieu',
  user_id: dre.id,
  election_id: le_wagon_band.id,
  status: 'pending',
  picture: 'url',
  video_url: 'video_url',
  tagline: "I am all about the bass",
  aboutme: "Costa Rican crooner brought up on power ballads but now converted to Raggaeton",
  promise1: "I will organise monthly performances for all of your family and friends",
  promise2: "I will never fall asleep during band practice",
  promise3: "I will only play Reggaeton",
  whyme: "I am hardworking, dedicated and love music :D",
  youtube_url: "hhttps://www.youtube.com/watch?v=DuvENlZR9zI" )

  band2 = Candidature.create(
  name: "Chris B",
  user_id: chris.id,
  election_id: le_wagon_band.id ,
  status: 'pending',
  picture: 'url',
  video_url: 'video_url',
  tagline: "Let's make sweet music!",
  aboutme: "SF native with a passion for music, code and design",
  promise1: "Everyone will get to vote on what pieces we perform",
  promise2: "Once a month, everyone will swap instruments and play something new",
  promise3: "We will have weekly Sunday jam sessions",
  whyme: "I will bring California soul to the heart of Barcelona",
  youtube_url: "https://www.youtube.com/watch?v=yE9oTnHhFrM")

  band4 = Candidature.create(
  name: "Tori",
  user_id: tori.id,
  election_id: le_wagon_band.id ,
  status: 'pending',
  picture: 'url',
  video_url: 'video_url',
  tagline: "Creative | Yogi | Coder | Aspiring band president",
  aboutme: "Living with my big toe outside the comfort zone and always up for an adventure" ,
  promise1: "I love old music - Supertramp to the Beatles, Janis Joplin to Fleetwood Mac - but as a band we will play all styles",
  promise2: "Optional stretching after band practice...",
  promise3: "...and ginger shots to keep us all healthy:)",
  whyme: "The true beauty of music is that it connects people. It carries a message and I want us to be the messengers" )

  band5 = Candidature.create(
  name: "Jennifer Lynch",
  user_id: jen.id,
  election_id: le_wagon_band.id ,
  status: 'pending',
  picture: 'url',
  video_url: 'video_url',
  tagline: "Only classical music so we can all CHILL OUT",
  aboutme: "Scottish psychology grad, picture taker, traveller and ex-professional cellist",
  promise1: "I am also a part-time composer so we can play original music :)",
  promise2: "I know all the night club owners so we will perform at BCN's hottest venues",
  promise3: "Once a month we will do a band bar crawl - playing and drinking at the same time.",
  whyme: "Pick me for some serious harmonies and a whole lot of instrumental fun",
  youtube_url: "https://www.youtube.com/watch?v=-9yOgjmPfG0")


  puts "creating pet election candidates"

  pet1 = Candidature.create(
  name: "Mini Zozzo",
  user_id: minizozzo.id,
  election_id: le_wagon_pet.id ,
  status: 'pending',
  picture: 'url',
  video_url: 'video_url',
  tagline: "Everybody needs a mini-me",
  aboutme: "I am actually Zozzo's grandson",
  promise1: "I will play football with you anytime.",
  promise2: "I will eat any food that you don't want",
  promise3: "But...I won't eat any leather boots. Especially not Ellyn's.",
  whyme: "I will always be there to comfort you when your rake just won't turn green")

 pet2 = Candidature.create(
 name: "Ruby",
 user_id: ruby.id,
 election_id: le_wagon_pet.id ,
 status: 'pending',
 picture: 'url',
 video_url: 'video_url',
 tagline:  "I'm not just a pet. I can help you pseudocode.",
 aboutme: "15 year old parrot who has been a TA at Le Wagon Bali",
 promise1:  "Fluent in ruby and javascript - I can help you when you get stuck.",
 promise2: "I tell great jokes.",
 promise3: "I am also surprisingly great at French rap",
 whyme: "I have the same name as a coding language. What more could you want?")

 pet3 = Candidature.create(
 name: "Python",
 user_id: python.id,
 election_id: le_wagon_pet.id ,
 status: 'pending',
 picture: 'url',
 video_url: 'video_url',
 tagline:  "Misunderstood snake looking for company and a place to hang out",
 aboutme: "New to Barcelona. Looking for coding pals and a cool warehouse to spend my days",
 promise1:  "I am very low-maintenance - I only need to eat once a month",
 promise2: "Very happy to keep Zozzo company...",
 promise3: "I can help you with advanced analytics",
 whyme: "I'll  bring a fresh perspective to Le Wagon BCN")


  puts "creating community manager candidate seeds"

  community1 = Candidature.create(
  name: "Avalon",
  user_id: avalon.id,
  election_id: le_wagon_community_manager.id ,
  status: 'pending',
  picture: 'url',
  video_url: 'video_url',
  tagline: "Event manager with a passion for learning from different cultures",
  aboutme: "Dutchie who lived in many countries before settling in her beloved Barcelona",
  promise1: "I will help you from application to your first coding job and beyond",
  promise2: "I will bring the best of BCN's tech scene to Le Wagon students",
  promise3: "I will create a wonderful atmosphere for you to learn. With lots of plants",
  whyme: "I strive to bring more equality to the tech community and pass on what I've learned to others")

  community2 = Candidature.create(
  name: "Judy",
  user_id: judy.id,
  election_id: le_wagon_community_manager.id ,
  status: 'pending',
  picture: 'url',
  video_url: 'video_url',
  tagline: "",
  aboutme: "",
  promise1: "",
  promise2: "",
  promise3: "",
  whyme: "")


  community2 = Candidature.create(
  name: "Rob",
  user_id: rob.id,
  election_id: le_wagon_community_manager.id ,
  status: 'pending',
  picture: 'url',
  video_url: 'video_url',
  tagline: "",
  aboutme: "",
  promise1: "",
  promise2: "",
  promise3: "",
  whyme: "")


puts 'Creating votes seeds...'

EligibleVoter.all.each do |eligible_voter|
  Vote.create(
    candidature_id: eligible_voter.election.candidatures.sample,
    eligible_voter_id: eligible_voter.id,
    )

end

puts "Finished seeding!"
