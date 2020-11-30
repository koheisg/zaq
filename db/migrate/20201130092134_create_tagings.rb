class CreateTagings < ActiveRecord::Migration[6.0]
  def change
    create_table :tagings do |t|
      t.references :tag, null: false, foreign_key: true
      t.references :tagable, polymorphic: true, null: false

      t.timestamps
    end
  end
end
