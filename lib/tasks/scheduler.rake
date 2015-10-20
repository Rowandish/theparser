desc 'This task is called by the Heroku scheduler add-on'
task weekly_summary: :environment do
  puts 'Sending mail...'
  User.find_each do |user|
    UserMailer.weekly_summary(user).deliver_now
  end
  puts 'done.'
end

task update_promotion_movies: :environment do
  puts 'Updating movies for UciCinema'
  UciCinema.find(1).parse
  puts 'Updating movies for Cinema Rivoli'
  RivoliCinema.find(2).parse
  puts 'Updating movies for Cinema Fiume'
  FiumeCinema.find(3).parse
  puts 'Updating movies for Cinema Kappadue'
  FiumeCinema.find(4).parse
  puts 'Updating movies for Cinema Diamante'
  FiumeCinema.find(5).parse
  puts 'Updating movies for Cinema Pindemonte'
  FiumeCinema.find(6).parse
  puts 'Done'
end
