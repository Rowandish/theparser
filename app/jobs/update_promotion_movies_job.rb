class UpdatePromotionMoviesJob < ActiveJob::Base
  queue_as :default

  def perform(*args)
    Cinema.parse
  end
end
