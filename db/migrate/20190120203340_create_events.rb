class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :name
      t.string :address
      t.string :phone_number
      t.decimal :lng
      t.decimal :lat
      t.string :category
      t.string :date
      t.integer :love
      t.integer :hate
      t.decimal :rating
      t.integer :price
      t.string :photo_reference
      t.string :place_id
      t.string :reason
      t.string :google_url
      t.string :website
      t.references :trip, foreign_key: true

      t.timestamps
    end
  end
end
