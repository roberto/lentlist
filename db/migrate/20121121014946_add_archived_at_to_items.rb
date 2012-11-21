class AddArchivedAtToItems < ActiveRecord::Migration
  def change
    add_column :items, :archived_at, :datetime
  end
end
