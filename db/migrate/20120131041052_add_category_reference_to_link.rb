class AddCategoryReferenceToLink < ActiveRecord::Migration
  def change
    add_column :links, :category_id, :integer
    add_index :links, :category_id
  end
end
