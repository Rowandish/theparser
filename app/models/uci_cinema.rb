class UciCinema < Cinema
  def parse
    films.each(&:destroy)
    doc = Nokogiri::HTML(open(webpage))
    stack = []
    bool = false
    doc.css('#inside').children.each do |node|
      bool = true if (node['id'] == 'ricomincioda3')
      stack << node if bool && %w(filmOdd filmEven).include?(node['class'])
    end
    stack.each do |node|
      Film.create(name: node.css('.titolo')[0].content,
                  date: get_date_from_string(node.css('.data')[0].content),
                  image: node.css('img')[0]['src'], cinema: self)
    end
  end

  private

  # Da "Martedi' 27 Ottobre" alla data corrispondente
  def get_date_from_string(date)
    Date.parse(exctract_day_and_month_from_date(convert_month_from_ita_to_eng(date)))
  end

  # Da "Martedi' 27 Ottobre" a "27 Ott"
  def exctract_day_and_month_from_date(date)
    date.match(/[0-9]{2} [a-zA-Z]{3}/).to_s
  end
end
