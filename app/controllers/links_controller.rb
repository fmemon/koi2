class LinksController < ApplicationController

  before_filter :authenticate_user!, :except => [:index, :show, :search]

  def index
#   	@promoted_link = Link.all.first
#   	@promoted_link.promoted = true
#   	@promoted_link.save
#     @links = Link.find(:all, 
#                        :joins => 'LEFT JOIN votes on votes.link_id = links.id',
#                        :group => 'links.id, links.url, links.title, links.created_at, links.updated_at, links.user_id, links.short_url',
#                        :order => 'SUM(COALESCE(votes.score, 0)) DESC')

   #for link submission
   @link = Link.new

    @links = nil
    @found = false
    
    #@links = Links.find(:all)
    #, :conditions => ['LOWER(title) LIKE ? OR LOWER(url) LIKE ?', "%#{params[:term]}%", "%#{params[:term]}%"])
    
   @links = Link.find(:all, 
       :conditions => ['LOWER(title) LIKE ? OR LOWER(url) LIKE ?', "%#{params[:term]}%", "%#{params[:term]}%"],
                       :joins => 'LEFT JOIN votes on votes.link_id = links.id',
                       :group => 'links.id, links.url, links.title,links.thumbnail, links.promoted, links.created_at, links.updated_at, links.user_id, links.short_url',
                       :order => 'SUM(COALESCE(votes.score, 0)) DESC')
                       
    
    if @links.empty?
      if params[:term].blank? 
        flash.now[:notice] ="Please enter in a search term to search" 
      else
        flash.now[:notice] ="Sorry nothing found for #{params[:term]}" 
      end      
			@links = Link.find(:all, 
							 :joins => 'LEFT JOIN votes on votes.link_id = links.id',
                       :group => 'links.id, links.url, links.title,links.thumbnail, links.promoted, links.created_at, links.updated_at, links.user_id, links.short_url',
							 :order => 'SUM(COALESCE(votes.score, 0)) DESC')
    else
      @found = true
    end
    
    @promoted_link = Link.all.first
    if @promoted_link
  	  @promoted_link.promoted = true
  	  @promoted_link.save
    end
    render :index, :links => @links,   	:promoted_link => @promoted_link 
  end

  def show
    @link = Link.find(params[:id])
    @user = current_user

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def new
    @link = Link.new

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def create
    @link = Link.new(params[:link])
    @link.user = current_user

    respond_to do |format|
      if @link.save!
        format.html { redirect_to(links_index_url, flash[:notice] => 'Link was successfully added.') }
      else
        format.html { render :action => "new" }
      end
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

  def upvote
    @link = Link.find(params[:id])
    @user = User.find(current_user.id)
    @vote = @link.votes.build(params[:link])
    @previous_vote = @link.votes.where(:user_id => @user.id).first
    
    @vote.user = @user
    @vote.link = @link
    @vote.score = 1
   		      
   if  @previous_vote.nil?
   			@vote.save!
   			redirect_to(links_path, flash[:notice] => 'Your up vote was added.') 
   else 
      if  @previous_vote.is_score_up?
        redirect_to(links_path, :notice => 'Already voted up on this link') 
      else
         @previous_vote.update_attributes!(:score => 1)
        redirect_to(links_path, :notice =>  'Your vote have been changed to up.') 
      end
   end
    
    
#    if !current_user.votes.where(:link_id => @link.id).empty?
#    			@vote.save!
#    			redirect_to(links_path, flash[:notice] => 'Your vote was added.') 
#    else 
#       @vote.update_attributes(:score => 1)
#       redirect_to(links_path, :notice => 'Already voted up on this link') 
#    end
#     
# 		begin
# 			@vote.save!
# 		rescue ActiveRecord::RecordInvalid => e
# 			redirect_to(links_path, :notice => 'Already voted up on this link') 
# 	  else
# 	  		redirect_to(links_path, flash[:notice] => 'Your vote was added.') 
# 		end
		
		
  end

  def downvote
    @link = Link.find(params[:id])
    @user = User.find(current_user.id)
    @vote = @link.votes.build(params[:link])
    @vote.user = @user
    @vote.link = @link
    @vote.score = -1
        
    @previous_vote = @link.votes.where(:user_id => @user.id).first
    
    @vote.user = @user
    @vote.link = @link
    @vote.score = -11
   		      
		 if  @previous_vote.nil?
					@vote.save!
					redirect_to(links_path, flash[:notice] => 'Your down vote was added.') 
		 else 
				if  @previous_vote.is_score_down?
					redirect_to(links_path, :notice => 'Already voted down on this link') 
				else
					 @previous_vote.update_attributes!(:score => -1)
					redirect_to(links_path, :notice =>  'Your vote have been changed to down.') 
				end
		 end
  end
  
  def search
  	@promoted_link = Link.all.first
  	@promoted_link.promoted = true
  	@promoted_link.save

    @links = nil
    @found = false
    
    #@links = Links.find(:all)
    #, :conditions => ['LOWER(title) LIKE ? OR LOWER(url) LIKE ?', "%#{params[:term]}%", "%#{params[:term]}%"])
    
   @links = Link.find(:all, 
       :conditions => ['LOWER(title) LIKE ? OR LOWER(url) LIKE ?', "%#{params[:term]}%", "%#{params[:term]}%"],
                       :joins => 'LEFT JOIN votes on votes.link_id = links.id',
                       :group => 'links.id, links.url, links.title,links.thumbnail, links.promoted, links.created_at, links.updated_at, links.user_id, links.short_url',
                       :order => 'SUM(COALESCE(votes.score, 0)) DESC')
                       
    
    if @links.empty?
      if params[:term].blank? 
        flash.now[:notice] ="Please enter in a search term to search" 
      else
        flash.now[:notice] ="Sorry nothing found for #{params[:term]}" 
      end      
			@links = Link.find(:all, 
							 :joins => 'LEFT JOIN votes on votes.link_id = links.id',
                       :group => 'links.id, links.url, links.title,links.thumbnail, links.promoted, links.created_at, links.updated_at, links.user_id, links.short_url',
							 :order => 'SUM(COALESCE(votes.score, 0)) DESC')
    else
      @found = true
    end
    render :index, :links => @links,   	:promoted_link => @promoted_link 
  end

  end
