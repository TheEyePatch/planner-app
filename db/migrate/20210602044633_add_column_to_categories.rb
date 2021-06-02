class AddColumnToCategories < ActiveRecord::Migration[6.1]
  def change
    add_column :categories, :user_id, :bigint
    add_index :categories, :user_id
  end
end
