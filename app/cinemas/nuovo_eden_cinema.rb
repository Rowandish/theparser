class NuovoEdenCinema < CinemaParser
  def initialize
    super 'Cinema Nuovo Eden'
  end

  def parse
    @doc.css('.antProg').each do |node|
      dates = node.css('.antTextProg p')[0].content
      title = node.css('.antTextProg a')[0].content
      image = node.css('.antFotoProg img')[0]['src']

      # Se ho al, significa che e' una data multipla, in questo caso creo piu' film
      if dates.include?(' al ')
        dates = dates.split(' al ').map(&:to_date)
        start_date = dates[0]
        end_date = dates[1]
        start_date.upto(end_date).each do |date|
          Film.create(name: title,
                      date: date,
                      image: image, cinema: @cinema)
        end
      else
        Film.create(name: title,
                    date: node.css('.antTextProg p')[0].content.to_date,
                    image: image, cinema: @cinema)
      end
    end
  end
end
