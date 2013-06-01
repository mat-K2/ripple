class AddOauthFlgToServices < ActiveRecord::Migration
  def change
    add_column :services, :oauth_flg, :boolean
  end
end
