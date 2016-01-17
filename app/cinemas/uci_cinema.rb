class UciCinema < CinemaParser
  def initialize
    super 'UCI Cinemas Verona'
  end

  def parse
    stack = []
    bool = false
    @doc.css('#inside').children.each do |node|
      bool = true if node['id'] == 'ricomincioda3'
      stack << node if bool && %w(filmOdd filmEven).include?(node['class'])
    end
    stack.each do |node|
      Film.create(name: node.css('.titolo')[0].content,
                  date: DateHelper.get_date_from_string(node.css('.data')[0].content),
                  image: node.css('img')[0]['src'], cinema: @cinema)
    end
  end
end
