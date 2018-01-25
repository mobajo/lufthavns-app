class CreateArrivals < ActiveRecord::Migration[5.1]
  def change
    create_table :arrivals do |t|
      t.string :time
      t.string :city
      t.string :airport
      t.string :airline
      t.string :plane

      t.timestamps
    end
  end
end
