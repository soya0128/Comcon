class CreateEmails < ActiveRecord::Migration[6.0]
  def change
    create_table :emails do |t|
      t.string     :subject,   null: false
      t.text       :content, null: false
      t.references :user,    null: false, foreign_key: true
      t.timestamps
    end
  end
end
