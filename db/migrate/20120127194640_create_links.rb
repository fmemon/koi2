class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :url
      t.string :title
      t.references :user
      t.string :short_url
      t.string :thumbnail
      t.boolean :promoted
      t.string :category

      t.timestamps
    end
    add_index :links, :user_id
  end
end
