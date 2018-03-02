class AddMetaDataToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :metadata, :hstore
  end
end
