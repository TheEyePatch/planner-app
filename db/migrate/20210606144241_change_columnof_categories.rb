class ChangeColumnofCategories < ActiveRecord::Migration[6.1]
  def change
    rename_column :categories, :category_name, :name
  end
end
