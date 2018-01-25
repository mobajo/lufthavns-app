class CreateDepartures < ActiveRecord::Migration[5.1]
  def change
    create_table :departures do |t|
      t.string :time
      t.string :city
      t.string :airport
      t.string :airline
      t.string :plane
      t.string :terminal
      t.string :gate

      t.timestamps
    end
  end
end
