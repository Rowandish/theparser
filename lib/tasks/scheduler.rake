desc 'This task is called by the Heroku scheduler add-on'
task weekly_summary: :environment do
  puts 'Sending mail...'
  User.find_each do |user|
    UserMailer.weekly_summary(user).deliver_now
  end
  puts 'done.'
end
