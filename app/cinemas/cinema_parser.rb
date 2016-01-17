class CinemaParser
  require 'nokogiri'
  require 'open-uri'

  def initialize(cinema_name)
    return if cinema_name.nil?
    @cinema = Cinema.where(name: cinema_name).first
    @cinema.delete_films
    @doc = Nokogiri::HTML(open(@cinema.webpage))
  end

  def parse
    p 'Not implemented'
  end
end
