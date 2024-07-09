class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.string :content, null: false
      t.timestamps
      t.references :user, null: false, foreign_key: true
      t.references :event, null: false, foreign_key: true
    end
  end
end
