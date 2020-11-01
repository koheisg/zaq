class CreateUserAuthentications < ActiveRecord::Migration[6.0]
  def change
    create_table :user_authentications do |t|
      t.references :authenticationable, polymorphic: true, null: false

      t.timestamps
    end
  end
end
