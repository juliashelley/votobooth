puts 'Destroying seeds...'
Vote.destroy_all
Candidature.destroy_all
Election.destroy_all
User.destroy_all


puts 'Creating user seeds'

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
doncho = User.create(
  first_name: 'Doncho',
  last_name: 'Penev',
  email: 'doncho@gmail.com',
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
marin = User.create(
  first_name: "Marin",
  last_name: "",
  email: "marin@gmail.com",
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


100.times do |user|
  User.create(
    first_name: Faker::Artist.name,
    last_name: Faker::Artist.name,
    email: '#{self.first_name}@gmail.com',
    password: 'password',
    )
end

puts 'Creating election seeds...'

le_wagon_band = Election.create(
  name: 'Le Wagon Band President election',
  user_id: gus.id,
  description: "Devs need a soundtrack to their code. We need a leader to organize weekly band rehearsals and performances.  🎤🎸🥁🎶",
  dates: "#{DateTime.yesterday} to #{DateTime.tomorrow}")

le_wagon_pet = Election.create(
  name: 'Le Wagon new pet',
  user_id: gus.id,
  description: "Our beloved Zozzo needs a friend. Who should it be?",
  dates: "#{DateTime.yesterday - 3.day} to #{DateTime.yesterday - 1.day}")

le_wagon_community_manager = Election.create(
  name: 'Le Wagon Community Manager'
  user_id: gus.id,
  description: "Vote for a special person who can turn Le Wagon BCN into an even greater community than it is today",
  dates: "#{DateTime.yesterday - 500.day} to #{DateTime.yesterday - 480.day}" )


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

band1 = Candidature.create (
  name: "Dre Leroy-Beaulieu",
  user_id: dre.id,
  election_id: le_wagon_band.id ,
  status: 'pending',
  picture: 'url',
  video_url: 'video_url',
  tagline: "I am all about the bass",
  aboutme: "Costa Rican crooner brought up on power ballads but now converted to Raggaeton",
  promise1: "I will organise monthly performances for all of your family and friends",
  promise2: "I will never fall asleep during band practice",
  promise3: "I will only play Reggaeton",
  whyme: "I am hardworking, dedicated and love music :D" )

  band2 = Candidature.create (
  name: "Chris B",
  user_id: chris.id,
  election_id: le_wagon_band.id ,
  status: 'pending',
  picture: 'url',
  video_url: 'video_url',
  tagline: "Le Wagon band ",
  aboutme: ,
  promise1: ,
  promise2: ,
  promise3: "We will have weekly Sunday jam sessions",
  whyme: "I will bring California soul to the heart of Barcelona" )

  band3 = Candidature.create (
  name: "Doncho Penev",
  user_id: doncho.id,
  election_id: le_wagon_band.id ,
  status: 'pending',
  picture: 'url',
  video_url: 'video_url',
  tagline: "",
  aboutme: ,
  promise1: "Good playing will be rewarded with chocolate",
  promise2: ,
  promise3: ,
  whyme: )

  band4 = Candidature.create (
  name: "Marin",
  user_id: marin.id,
  election_id: le_wagon_band.id ,
  status: 'pending',
  picture: 'url',
  video_url: 'video_url',
  tagline: ,
  aboutme: ,
  promise1: ,
  promise2: ,
  promise3: ,
  whyme: )

  band5 = Candidature.create (
  name: "Jennifer Lynch",
  user_id: jen.id,
  election_id: le_wagon_band.id ,
  status: 'pending',
  picture: 'url',
  video_url: 'video_url',
  tagline: ,
  aboutme: ,
  promise1: ,
  promise2: ,
  promise3: ,
  whyme: )

  puts "candidates - Chris (drums), Doncho (conductor), Dre (vocals), Jen (cello), avalon won community manager"

  pet1 = Candidature.create (
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
 aboutme: "15 year old parrot who has been a TA Le Wagon Bali",
 promise1:  "Fluent in ruby and javascript - I can help you when you get stuck.",
 promise2: "",
 promise3: "I am also surprisingly great at French rap",
 whyme: "")

 pet3 = Candidature.create(
 name: "",
 user_id: ruby.id,
 election_id: le_wagon_pet.id ,
 status: 'pending',
 picture: 'url',
 video_url: 'video_url',
 tagline:  "",
 aboutme: "",
 promise1:  "",
 promise2: "",
 promise3: "",
 whyme: "")



puts 'Creating votes seeds...'

User.all.each do |voter|
  Vote.create(
    candidature_id: ,
    eligible_voter_id: ,
    )

  end
# Vote.create(
#   candidature_id: r1.id,
#   eligible_voter_id: a.id,
#   )
# Vote.create(
#   candidature_id: r1.id,
#   eligible_voter_id: b.id,
#   )
# Vote.create(
#   candidature_id: r1.id,
#   eligible_voter_id: c.id,
#   )
# Vote.create(
#   candidature_id: r1.id,
#   eligible_voter_id: d.id,
#   )

puts "Finished seeding!"
