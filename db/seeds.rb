puts 'Destroying seeds...'
User.destroy_all
Election.destroy_all
Candidature.destroy_all


puts 'Creating user seeds'
User.create(
  first_name: 'Jimothy',
  last_name: 'James',
  email: 'jimjames@gmail.com',
  password: 'password',)

puts 'Creating election seeds...'
Election.create(
  description: 'Acapella group president'
  candidate_signup_deadline: Date.new(2019,3,07)
  polls_close_at: Date.tomorrow
  polls_open_at: Date.yesterday
  results: 'Voting is still open'
  )

puts 'Creating candidatures seeds...'
Candidature.create(
  first_name: User.first.first_name,
  last_name: User.first.last_name,
  user_id: User.first.id,
  description: 'Toto lover'
  campaign_promise: 'Fight for the right to sing africa in our acapella group'
  photo:
  total_votes: 0
  )
puts "Done, let's migrate!"
