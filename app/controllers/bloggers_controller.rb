class BloggersController < ApplicationController
  # before_action 
  def show
    @blogger = Blogger.find(params[:id])
  end

  def new
    @blogger = Blogger.new
  end

  def create
    @blogger = Blogger.create(blogger_params)

    if @blogger.valid?
      redirect_to @blogger
    else
      flash[:errors] = @blogger.errors.full_messages
      redirect_to new_blogger_path
    end
  end
   

  def edit 
     @blogger = Blogger.find(params[:id])
  end 

  def update
      @blogger = Blogger.find(params[:id])
      if @blogger.update(blogger_params)
        redirect_to @blogger 
      else 
        flash[:errors] = @blogger.errors.full_messages
        redirect_to edit_blogger_path
  end
end  

  private 

  def blogger_params
    params.require(:blogger).permit(:name, :age, :bio)
  end
end
