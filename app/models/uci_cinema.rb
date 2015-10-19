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
                  date: node.css('.data')[0].content,
                  image: node.css('img')[0]['src'], cinema: self) if every_content_valorized? node
    end
  end

  private

  def every_content_valorized?(node)
    node.css('.titolo').is_a?(Array) && node.css('.data').is_a?(Array) && node.css('.img').is_a?(Array)
  end
end
