desc 'This task is called by the Heroku scheduler add-on'
task weekly_summary: :environment do
  User.find_each do |user|
    puts "Sending mail to #{user.name}..."
    UserMailer.weekly_summary(user).deliver_now
  end
  puts 'done.'
end

task update_promotion_movies: :environment do
  # puts 'Updating movies for UciCinema'
  # UciCinema.new.parse
  # puts 'Updating movies for Cinema Rivoli'
  # RivoliCinema.new.parse
  # puts 'Updating movies for Cinema Fiume'
  # FiumeCinema.new.parse
  # puts 'Updating movies for Cinema Kappadue'
  # KappadueCinema.new.parse
  # puts 'Updating movies for Cinema Diamante'
  # DiamanteCinema.new.parse
  # puts 'Updating movies for Cinema Pindemonte'
  # PindemonteCinema.new.parse
  puts 'Updating movies for Cinema Nuovo Eden'
  NuovoEdenCinema.new.parse
  puts 'Updating movies for Cinema Wiz Cinema'
  WizCinema.new.parse
  puts 'Done'
end
