class AddBorrowerIdToItems < ActiveRecord::Migration
  def change
    change_table :items do |t|
      t.remove :borrower
      t.references :borrower
      t.index :borrower_id
    end
  end
end
