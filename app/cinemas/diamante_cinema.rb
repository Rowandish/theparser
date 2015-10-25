class DiamanteCinema < FiumeCinemas
  def initialize
    @cinema = Cinema.where(name: 'Cinema Diamante').first
    super
  end
end
