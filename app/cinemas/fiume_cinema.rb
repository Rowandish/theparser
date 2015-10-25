class FiumeCinema < FiumeCinemas
  def initialize
    @cinema = Cinema.where(name: 'Cinema Fiume').first
    super
  end
end
