class AddUserIdToComments < ActiveRecord::Migration
  def change
    add_column :comments, :user_id, :integer
    add_index :comments, :user_id
  end
  
  Comment.all.each {|c| c.update_attributes(:user_id => User.find_by_email(c.commenter).id) }
  Comment.all.each {|c| c.update_attributes(:commenter => User.find(c.user_id).name) }

end
