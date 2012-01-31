class CommentsController < ApplicationController
  
  def create
    @link = Link.find(params[:link_id])
    @comment = @link.comments.create(params[:comment])

		if @comment.save!
			redirect_to(link_path(@link), :notice => 'Comment was successfully added.') 
		else
			render :action => 'new' 
		end
  end
  
end