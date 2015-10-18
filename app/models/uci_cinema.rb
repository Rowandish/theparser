class UciCinema < Cinema
  def parse
    doc = Nokogiri::HTML(open(webpage))
    stack = []
    bool = false
    doc.css('#inside').children.each do |node|
      bool = true if (node['id'] == 'ricomincioda3')
      stack << node if bool && %w(filmOdd filmEven).include?(node['class'])
    end
    stack.each do |node|
      films.each(&:destroy)
      Film.create(name: node.css('.titolo')[0].content, date: node.css('.data')[0].content, image: node.css('img')[0]['src'], cinema: self)
    end
  end
end
