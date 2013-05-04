class DropTestAccountsTable < ActiveRecord::Migration
  def up
    drop_table :test_accounts
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
