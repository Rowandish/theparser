class Cinema < ActiveRecord::Base
  has_many :films

  validates :name, uniqueness: true
  validates :webpage, uniqueness: true
  default_scope { where(enabled: true) }

  def delete_films
    films.each(&:destroy)
  end
end
