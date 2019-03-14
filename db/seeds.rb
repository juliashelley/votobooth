puts 'Destroying seeds...'
Vote.destroy_all
Candidature.destroy_all
Election.destroy_all
User.destroy_all


puts 'Creating user seeds'
jim = User.create(
  email: 'jimjames@gmail.com',
  password: 'password')

puts 'Creating election seeds...'
acapella = Election.create(
  name: 'Acapella group president',
  user_id: jim.id,
  status: 'Voting is still open!',
  description: "Year twelve's chance to elect the new president of the acapella group",
  voting_start_date: DateTime.yesterday,
  voting_end_date: DateTime.tomorrow,
  campaign_close_date: DateTime.tomorrow
  )

puts 'Creating candidatures seeds...'
Candidature.create(
  name: jim.email,
  user_id: jim.id,
  election_id: acapella.id,
  status: 'Approved',
  picture: 'url',
  video_url: 'video_url'
  )

puts 'Creating votes seeds...'
Vote.create(
  candidature_id: jim.id,
  eligible_voter_id: jim.id,
  )
puts "Finished seeding!"
