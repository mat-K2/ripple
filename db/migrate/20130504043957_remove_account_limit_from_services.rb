class RemoveAccountLimitFromServices < ActiveRecord::Migration
  def up
    remove_column :services, :account_limit
  end

  def down
    add_column :services, :account_limit, :integer
  end
end
