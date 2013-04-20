class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.string :name
      t.string :url
      t.string :summary
      t.text :introduction
      t.string :category
      t.integer :group_id

      t.timestamps
    end
  end
end
