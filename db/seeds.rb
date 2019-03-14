puts 'Destroying seeds...'
Vote.destroy_all
Candidature.destroy_all
Election.destroy_all
User.destroy_all


puts 'Creating user seeds'
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


puts 'Creating election seeds...'

acapella = Election.create(
  name: 'Acapella group president',
  user_id: rebecca.id,
  status: 'live',
  description: "Year twelve's chance to elect the new president of the acapella group",
  voting_start_date: DateTime.yesterday,
  voting_end_date: DateTime.tomorrow,
  campaign_close_date: DateTime.tomorrow
  )

prime = Election.create(
  name: 'English Prime Minister',
  user_id: pontus.id,
  status: 'live',
  description: "Anything to stop May",
  voting_start_date: DateTime.yesterday,
  voting_end_date: DateTime.tomorrow,
  campaign_close_date: DateTime.tomorrow
  )

puts 'Creating eligible voters...'

a = EligibleVoter.create(
  election_id: acapella.id,
  user_id: jim.id
  )
b = EligibleVoter.create(
  election_id: acapella.id,
  user_id: rebecca.id
  )
c = EligibleVoter.create(
  election_id: acapella.id,
  user_id: pontus.id
  )
d = EligibleVoter.create(
  election_id: acapella.id,
  user_id: julia.id
  )
e = EligibleVoter.create(
  election_id: acapella.id,
  user_id: jordi.id
  )

a2 = EligibleVoter.create(
  election_id: prime.id,
  user_id: jim.id
  )
b2 = EligibleVoter.create(
  election_id: prime.id,
  user_id: rebecca.id
  )
c2 = EligibleVoter.create(
  election_id: prime.id,
  user_id: pontus.id
  )
d2 = EligibleVoter.create(
  election_id: prime.id,
  user_id: julia.id
  )
e2 = EligibleVoter.create(
  election_id: prime.id,
  user_id: jordi.id
  )

puts 'Creating candidatures seeds...'

r1 = Candidature.create(
  name: rebecca.first_name,
  user_id: jim.id,
  election_id: acapella.id,
  status: 'approved',
  picture: 'url',
  video_url: 'video_url',
  promise1: 'Sing',
  promise2: 'More singing',
  promise3: 'Best songs',
  tagline: "I'm going to manage the accapella group how it deserves to be managed."
  )

j1 = Candidature.create(
  name: jordi.first_name,
  user_id: jordi.id,
  election_id: acapella.id,
  status: 'denied',
  picture: 'url',
  video_url: 'video_url',
  promise1: 'Yeah',
  promise2: "Rock'n roll",
  promise3: "Whatever",
  tagline: "They made me do it."
  )

r2 = Candidature.create(
  name: rebecca.first_name,
  user_id: rebecca.id,
  election_id: prime.id,
  status: 'pending',
  picture: 'url',
  video_url: 'video_url',
  promise1: 'BURN',
  promise2: 'THEM',
  promise3: 'ALL',
  tagline: "Not really, just a GoT reference"
  )

j2 = Candidature.create(
  name: julia.first_name,
  user_id: julia.id,
  election_id: prime.id,
  status: 'approved',
  picture: 'url',
  video_url: 'video_url',
  promise1: 'Be polite',
  promise2: 'Revote the brexit with VotoBooth',
  promise3: 'Kick out May',
  tagline: "I won't promise: I'll just show you."
  )

p2 = Candidature.create(
  name: pontus.first_name,
  user_id: pontus.id,
  election_id: prime.id,
  status: 'approved',
  picture: 'url',
  video_url: 'video_url',
  promise1: 'Respect',
  promise2: 'Attention',
  promise3: 'Good work',
  tagline: "I'll show you how democracy looks like."
  )


puts 'Creating votes seeds...'
Vote.create(
  candidature_id: r1.id,
  eligible_voter_id: a.id,
  )
Vote.create(
  candidature_id: r1.id,
  eligible_voter_id: b.id,
  )
Vote.create(
  candidature_id: r1.id,
  eligible_voter_id: c.id,
  )
Vote.create(
  candidature_id: r1.id,
  eligible_voter_id: d.id,
  )

puts "Finished seeding!"
