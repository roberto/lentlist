class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :title, null: false
      t.string :borrower

      t.timestamps
    end
  end
end
