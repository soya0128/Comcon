class CreateStorages < ActiveRecord::Migration[6.0]
  def change
    create_table :storages do |t|
      t.string     :name, null: false
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
