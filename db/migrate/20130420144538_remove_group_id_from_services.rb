class RemoveGroupIdFromServices < ActiveRecord::Migration
  def up
    remove_column :services, :group_id
    add_column :services, :account_limit, :integer
  end

  def down
    add_column :services, :group_id, :integer
    remove_column :services, :account_limit
  end
end
