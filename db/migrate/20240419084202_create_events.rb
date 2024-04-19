class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.date :occurred_on, null: false
      t.string :location, null: false
      t.integer :cause_type_id, null: false
      t.string :detailed_cause
      t.text :resolution
      t.text :prevention
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
