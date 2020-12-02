class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms do |t|
      t.string :name,           null: false
      t.integer :prefecture_id, null: false
      t.integer :year_id,       null: false
      t.integer :month_id,      null: false
      t.integer :capacity_id,   null: false
      t.timestamps
    end
  end
end
