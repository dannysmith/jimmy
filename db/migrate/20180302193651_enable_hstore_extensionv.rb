class EnableHstoreExtensionv < ActiveRecord::Migration[5.1]
  def change
    enable_extension 'hstore'
  end
end
