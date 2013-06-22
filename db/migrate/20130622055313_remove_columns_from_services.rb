class RemoveColumnsFromServices < ActiveRecord::Migration
  def up
    remove_column :services, :key
    remove_column :services, :secret
    remove_column :services, :oauth_flg
  end

  def down
    add_column :services, :key, :string
    add_column :services, :secret, :string
    add_column :services, :oauth_flg, :boolean
  end
end
