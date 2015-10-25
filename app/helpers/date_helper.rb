# Classe statica che gestisce tutto quello che riguarda le date
class DateHelper
  # Da "Martedi' 27 Ottobre" alla data corrispondente
  def self.get_date_from_string(date)
    Date.parse(exctract_day_and_month_from_date(convert_month_from_ita_to_eng(date)))
  end

  def self.get_thursday_date(node)
    date_array = extract_dates_from_string(node.css('.textOrari').first.content)
    date_array.each do |date|
      convert_date = convert_to_date(date)
      return convert_date if convert_date.thursday?
    end
  end

  # date = "In programmazione il: 19 Ott 2015 - 22:3020 Ott 2015 - 16:45 20:0021 Ott 2015 - 16:45 20:00 22:30"
  # output = ["19 Ott 2015 - 22:30", "20 Ott 2015 - 16:45", "21 Ott 2015 - 16:45"]
  def self.extract_dates_from_string(date)
    date.to_enum(:scan, /[0-9]{2} [a-zA-Z]{3} [0-9]{4} - [0-9]{2}:[0-9]{2}/).map { Regexp.last_match.to_s }
  end

  # Data una string del tipo 19 Oct 2015 - 22:30 la converte in Mon, 19 Oct 2015 22:30:00 +0000
  def self.convert_to_date(date)
    DateTime.strptime(convert_month_from_ita_to_eng(date), '%d %b %Y - %H:%M')
  end

  private

  # Da "Martedi' 27 Ottobre" a "27 Ott"
  def self.exctract_day_and_month_from_date(date)
    date.match(/[0-9]{2} [a-zA-Z]{3}/).to_s
  end

  # Data una string del tipo 19 Ott 2015 - 22:30 la converte in 19 Oct 2015 - 22:30
  def self.convert_month_from_ita_to_eng(date)
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
    english_to_italian.each { |en, it| date.gsub!(/\b#{it}\b/i, en) }
    date
  end
end
