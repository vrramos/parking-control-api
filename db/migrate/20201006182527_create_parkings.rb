class CreateParkings < ActiveRecord::Migration[5.1]
  def change
    create_table :parkings do |t|
      t.string :plate
      t.string :time
      t.boolean :paid
      t.boolean :left
    end
  end
end
