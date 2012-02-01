class CommentsController < ApplicationController
   before_filter :authenticate_user!

  def create
    @link = Link.find(params[:link_id])
    @comment = @link.comments.create(params[:comment])

    @comment.user_id = current_user.id
    @comment.commenter = current_user.name

		if @comment.save!
			redirect_to(link_path(@link), :notice => 'Comment was successfully added.') 
		else
			render :action => 'new' 
		end
  end
  
end