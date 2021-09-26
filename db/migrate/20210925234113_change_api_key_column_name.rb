class ChangeApiKeyColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :api_keys, :key, :value
  end
end
