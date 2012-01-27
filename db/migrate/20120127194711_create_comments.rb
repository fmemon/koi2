class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :commenter
      t.text :body
      t.references :link

      t.timestamps
    end
    add_index :comments, :link_id
  end
end
