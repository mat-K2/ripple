class AddApproveFlgToEntries < ActiveRecord::Migration
  def change
    add_column :entries, :approve_flg, :boolean
  end
end
