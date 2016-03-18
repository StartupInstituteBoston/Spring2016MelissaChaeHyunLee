class AddColumnNameToOwner < ActiveRecord::Migration
  def change
    add_column :owners, :name, :string, null: false
  end
end
