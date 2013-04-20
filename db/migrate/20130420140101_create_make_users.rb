class CreateMakeUsers < ActiveRecord::Migration
  def change
    create_table :make_users do |t|
      t.integer :user_id
      t.integer :service_id

      t.timestamps
    end
  end
end
