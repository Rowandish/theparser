class PindemonteCinema < FiumeCinemas
  def initialize
    @cinema = Cinema.where(name: 'Cinema Pindemonte').first
    super
  end
end