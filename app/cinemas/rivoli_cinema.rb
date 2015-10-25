# RivoliCinema, problema: la promozione 2x1 vale solo di giovedì e l'html non ha alcuna indicazione sulla natura della data
class RivoliCinema < CinemaParser
  def initialize
    @cinema = Cinema.where(name: 'Multisala Rivoli').first
    super
  end

  def parse
    super
    @doc.css('body > div').each do |film|
      children = film.children
      Film.create(name: children.css('.titoloFilm')[0].content,
                  date: DateHelper.get_thursday_date(children),
                  image: children.css('.locandina_b')[0]['src'],
                  cinema: @cinema) if film_on_thursday?(children)
    end
  end

  private

  def film_on_thursday?(node)
    return false if node.css('.textOrari').first.nil?
    date_array = DateHelper.extract_dates_from_string(node.css('.textOrari').first.content)
    date_array.each do |date|
      return true if DateHelper.convert_to_date(date).thursday?
    end
    false
  end
end
