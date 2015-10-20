class FiumeCinema < Cinema
  def parse
    films.each(&:destroy)
    doc = Nokogiri::HTML(open(webpage))
    date_that_should_be_summed = 0
    doc.css('table').each do |table|
      # Dal sito è complesso reperire la data effettiva: visto che so per certo che la data è il primo mercoledì dopo ila giornata odierna metto la data con questo trucco.
      # Alla seconda occorrenza della promozione il mercoledì sarà il prossimo, quindi data odierna + 7 e il mercoledì successivo.
      if film_with_discount?(table)
        Film.create(name: table.css('strong')[0].content.match(/[a-zA-Z ?]+/).to_s,
                  date: date_that_should_be_summed.days.from_now.end_of_week(:thursday),
                  image: 'http://www.cinemafiume.it' + table.css('img')[0]['src'],
                  cinema: self)
        date_that_should_be_summed += 7
      end
    end
  end

  private

  # True se nella table vi e' un tag strong che contiene 'MERCOLEDI INGRESSO'
  def film_with_discount?(table)
    table.css('strong').each do |node|
      return true if node.content.include?('MERCOLEDI INGRESSO')
    end
    false
  end
end
