class Ratings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.references :user, index: true
      t.integer :rateable_id
      t.string :rateable_type
      t.boolean :rate, null: false

      t.timestamps
  end
end
