class CreateMembers < ActiveRecord::Migration[6.0]
  def change
    create_table :members do |t|
      t.string :postal_code, null: false
      t.integer :prefecture_id, null: false
      t.string :address, null: false
      t.string :building_name
      t.string :phone_number, null: false
      t.integer :part_id, null: false
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
