# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create(name: 'Paolo', email: 'paolo.guglielmini.vr@gmail.com')
UciCinema.create(name: 'UCI Cinemas Verona', address: 'Via Monte Amiata, 37057 San Giovanni Lupatoto VR', webpage: 'http://www.ucicinemas.it/generic/rassegne.php', promotion_name: 'Ricomincio da tre', promotion_desc: 'Tutti i martedì film a 3 euro', enabled:true)
Film.create(name: 'minions', date: '27 Ottobre', cinema: UciCinema.first)
