class OzCinema < CinemaParser
  def initialize
    super 'Multisala Oz'
  end

  def parse
    @doc.css('.rivediamoli_wiz').children.each do |node|
      if %w(filmOdd filmEven).include?(node['class'])
        Film.create(name: node.css('.titolo')[0].content,
                    date: DateHelper.get_date_from_string(node.css('.data')[0].content),
                    image: node.css('img')[0]['src'], cinema: @cinema)
      end
    end
  end
end
