class Cinema < ActiveRecord::Base
  has_many :films

  validates :name, uniqueness: true
  validates :webpage, uniqueness: true
  default_scope { where(enabled: true) }

  require 'nokogiri'
  require 'open-uri'

  def parse
    puts 'No implementation'
  end

  # Data una string del tipo 19 Ott 2015 - 22:30 la converte in 19 Oct 2015 - 22:30
  def convert_month_from_ita_to_eng(date)
    english_to_italian =
    {
      'Jan' => 'Gen',
      'Feb' => 'Feb',
      'Mar' => 'Mar',
      'Apr' => 'Apr',
      'May' => 'Mag',
      'Jun' => 'Giu',
      'Jul' => 'Lug',
      'Aug' => 'Ago',
      'Sep' => 'Set',
      'Oct' => 'Ott',
      'Nov' => 'Nov',
      'Dec' => 'Dic'
    }
    english_to_italian.each do |en, it|
      date.gsub!(/\b#{it}\b/i, en)
    end
    date
  end
end
