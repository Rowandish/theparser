# RivoliCinema, problema: la promozione 2x1 vale solo di giovedì e l'html non ha alcuna indicazione sulla natura della data
class RivoliCinema < Cinema
  def parse
    films.each(&:destroy)
    doc = Nokogiri::HTML(open(webpage))
    doc.css('body > div').each do |film|
      children = film.children
      Film.create(name: children.css('.titoloFilm')[0].content,
                  date: get_thursday_date(children),
                  image: children.css('.locandina_b')[0]['src'],
                  cinema: self) if film_on_thursday?(children)
    end
  end

  private

  def get_thursday_date(node)
    date_array = extract_dates_from_string(node.css('.textOrari').first.content)
    date_array.each do |date|
      convert_date = convert_to_date(date)
      return convert_date if convert_date.thursday?
    end
  end

  def film_on_thursday?(node)
    return false if node.css('.textOrari').first.nil?
    date_array = extract_dates_from_string(node.css('.textOrari').first.content)
    date_array.each do |date|
      return true if convert_to_date(date).thursday?
    end
    false
  end

  # date = "In programmazione il: 19 Ott 2015 - 22:3020 Ott 2015 - 16:45 20:0021 Ott 2015 - 16:45 20:00 22:30"
  # output = ["19 Ott 2015 - 22:30", "20 Ott 2015 - 16:45", "21 Ott 2015 - 16:45"]
  def extract_dates_from_string(date)
    date.to_enum(:scan, /[0-9]{2} [a-zA-Z]{3} [0-9]{4} - [0-9]{2}:[0-9]{2}/).map { Regexp.last_match.to_s }
  end

  # Data una string del tipo 19 Oct 2015 - 22:30 la converte in Mon, 19 Oct 2015 22:30:00 +0000
  def convert_to_date(date)
    DateTime.strptime(convert_month_from_ita_to_eng(date), '%d %b %Y - %H:%M')
  end
end
