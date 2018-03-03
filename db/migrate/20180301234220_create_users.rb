class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    enable_extension 'pgcrypto'
    create_table :users, id: :uuid do |t|
      t.string :username,                         null: false
      t.string :primary_email,                    null: false
      t.string :name,                             null:false

      t.timestamps
    end
    add_index :users, :username
  end
end
