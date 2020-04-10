class DestinationsController < ApplicationController

  def show
    @destination = Destination.find(params[:id])
  end

  def search
    # if search by integer (destination.id)
    if params[:q].to_i >= 1
      # if exist
      if Destination.all.exists?(params[:q])
        @destination = Destination.find(params[:q])
        redirect_to @destination
      else
        redirect_to posts_path
      end
      # if search by string (destination.name)
    elsif params[:q].to_i == 0
      # if exist
      if Destination.all.exists?(name: params[:q])
        @destination = Destination.find_by(name: params[:q]) 
        redirect_to @destination
      else
        redirect_to posts_path
      end
    end
  end

  # collection select search
  def search
    # byebug
    @destination = Destination.find(params[:destination][:id])
    
    redirect_to @destination
  end

end
