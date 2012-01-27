class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.references :link
      t.references :user
      t.integer :score

      t.timestamps
    end
    add_index :votes, :link_id
    add_index :votes, :user_id
  end
end
