class CreateTestAccounts < ActiveRecord::Migration
  def change
    create_table :test_accounts do |t|
      t.string :name
      t.integer :service_id
      t.string :path

      t.timestamps
    end
  end
end
