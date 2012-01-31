class LinksController < ApplicationController

  before_filter :authenticate_user!, :except => [:index, :show, :search]

  def index
  
  # so user can submit a new link from the index page
   @link = Link.new

  # reset values
    @links = nil
    @found = false
    @promoted_link = nil
    fornotice =  " for '#{params[:term]}'"  
    
    if params[:term].blank? 
       @links = Link.voted_links
        flash[:success]  = "Please enter in a search term to search" 
    else
        @links = Link.by_searchterm(params[:term])
         if @links.empty?
           @links = Link.voted_links
           flash.now[:success] = "Sorry nothing found" + fornotice 
         else
           flash.now[:success] = "#{@links.length} " +  (@links.length> 1? 'links =' : 'link') + fornotice 
           @found = true
         end 
    end

    @promoted_link = Link.promoted_link

    render :index, :links => @links,   	:promoted_link => @promoted_link 
  end

  def show
    @link = Link.find(params[:id])
    @user = current_user
  end

  def new
    @link = Link.new
  end

  def create
    @link = Link.new(params[:link])
    @link.user = current_user

		if @link.save!
			redirect_to(links_index_url, flash[:notice] => 'Link was successfully added.') 
		else
			render :action => "new" 
      end
  end

  def latest
    @links = Link.latest
    render :action => 'index'
  end

  def talked_about
    @links = Link.find(:all)
    render :action => 'index'
  end
  
  def change_vote_setup
     @link = Link.find(params[:id])
    @user = User.find(current_user.id)
    @vote = @link.votes.build(params[:link])
    
    @vote.user = @user
    @vote.link = @link
    flash[:alert] = nil
    
   @previous_vote = @link.votes.where(:user_id => @user.id).first
  end
  
  def change_vote(newscore)
        change_vote_setup

           @vote.score = newscore
           score_text = "down"
           score_text = "up"  if newscore == 1

		 if  @previous_vote.nil?
					@vote.save!
					redirect_to(links_path, :alert => "Your #{score_text} vote was added.") 
		 else       
				if  (@previous_vote.is_score_down? && newscore == 1) ||  (@previous_vote.is_score_up? && newscore == -1)
					@previous_vote.update_attributes!(:score => newscore)
					redirect_to(links_path, :alert =>  "Your vote have been changed to #{score_text}.") 
				else
					redirect_to(links_path, :alert  => "Already voted #{score_text} on this link") 
				end
		 end   
  end

  def upvote
        #  change_vote_setup

    change_vote(1)
#     @vote.score = 1
#    		      
#    if  @previous_vote.nil?
#    			@vote.save!
#    			redirect_to(links_path, :alert => 'Your up vote was added.') 
#    else       
#       if  @previous_vote.is_score_down?
#         @previous_vote.update_attributes!(:score => 1)
#         redirect_to(links_path, :alert =>  'Your vote have been changed to up.') 
#       else
#         redirect_to(links_path, :alert  => 'Already voted up on this link') 
#       end
#    end
		
  end

  def downvote
    change_vote(-1)

#     @vote.score = -1
#    		      
# 		 if  @previous_vote.nil?
# 					@vote.save!
# 					redirect_to(links_path, :alert => 'Your down vote was added.') 
# 		 else 
# 				if  @previous_vote.is_score_up?
# 				  @previous_vote.update_attributes!(:score => -1)
# 					redirect_to(links_path, :alert =>  'Your vote have been changed to down.') 
# 				else
# 					redirect_to(links_path, :alert => 'Already voted down on this link') 
# 				end
#    end
  end

  end
