class AddOauthColumnsToServices < ActiveRecord::Migration
  def change
    add_column :services, :key, :string
    add_column :services, :secret, :string
  end
end
