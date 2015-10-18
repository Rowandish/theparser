class Cinema < ActiveRecord::Base
  has_many :films

  validates :name, uniqueness: true
  validates :webpage, uniqueness: true
  default_scope { where(enabled: true) }

  require 'nokogiri'
  require 'open-uri'

  def self.parse
    # subclasses.each { |subclass| subclass.first.parse }
    UciCinema.first.parse
  end
end
