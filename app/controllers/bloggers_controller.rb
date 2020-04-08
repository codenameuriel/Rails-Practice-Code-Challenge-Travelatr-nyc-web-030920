class BloggersController < ApplicationController
  # before_action 
  def show
    @blogger = Blogger.find(params[:id])
  end

  def new
    @blogger = Blogger.new
  end

  def create
    @blogger = Blogger.create(params)
    
  end

  private 

  def blogger_params
    params.require(:blogger).permit(:name, :age, :bio)
  end
end
