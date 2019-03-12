puts 'Destroying seeds...'
User.destroy_all
Election.destroy_all
Candidature.destroy_all


puts 'Creating user seeds'
User.create(
  email: 'jimjames@gmail.com',
  password: 'password')

puts 'Creating election seeds...'
Election.create(
  name: 'Acapella group president',
  status: 'Voting is still open!',
  description: "Year twelve's chance to elect the new president of the acapella group",
  voting_start_date: DateTime.yesterday,
  voting_end_date: DateTime.tomorrow,
  campaign_close_date: DateTime.tomorrow
  )

puts 'Creating candidatures seeds...'
Candidature.create(
  name: User.first.first_name + " " + User.first.last_name,
  status: 'Approved',
  picture: 'url',
  video_url: 'video_url'
  )
puts "Done, let's migrate!"
