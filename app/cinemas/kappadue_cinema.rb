class KappadueCinema < FiumeCinemas
  def initialize
    @cinema = Cinema.where(name: 'Cinema Kappadue').first
    super
  end
end