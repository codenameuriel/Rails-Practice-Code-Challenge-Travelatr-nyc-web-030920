class PostsController < ApplicationController
  def index
    unless params[:sort]
      @sort = false
      @posts = Post.all
    else
      @sort = true
      @sorted_posts = Post.sort_by_likes
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)

    if @post.valid?
      redirect_to @post
    else
      flash[:errors] = @post.errors.full_messages
      redirect_to new_post_path
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to @post
    else
      flash[:errors] = @post.errors.full_messages
      redirect_to edit_post_path
    end
  end

  def likes
     @post = Post.find(params[:id])
     @post.increment!(:likes)
     redirect_to @post
  end 

  private

  def post_params
    params.require(:post).permit(:title, :content, :blogger_id, :destination_id)
  end
end
