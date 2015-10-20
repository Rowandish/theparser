class AddDateToFilm < ActiveRecord::Migration
  def change
    add_column :films, :date, :datetime
  end
end
