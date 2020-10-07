class CreateParkings < ActiveRecord::Migration[5.1]
  def change
    create_table :parkings do |t|
      t.string :plate
      t.string :time
      t.boolean :paid, :default => false
      t.boolean :left, :default => false

      t.timestamps
    end
  end
end
