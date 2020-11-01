class CreateTwitterAuthentications < ActiveRecord::Migration[6.0]
  def change
    create_table :twitter_authentications do |t|
      t.string :uuid

      t.timestamps
    end
  end
end