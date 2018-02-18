class PostsController < ApplicationController
  def index
    @posts = Post.all
    
    # @posts.each do  |post|
    #   if post.id % 5 == 0 || post.id == 1 
    #     post.title = 'SPAM'
    #   end
    # end
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new
    @post.title = params[:post][:title]
    @post.body = params[:post][:body]

    if @post.save
      flash[:notice] = "Post was saved."
      redirect_to @post
    else
      flash.new[:alert] = "There was an error saving the post. Please try again."
      render :new
    end
  end
  
  def edit
  end
end