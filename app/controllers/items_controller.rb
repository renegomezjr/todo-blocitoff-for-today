class ItemsController < ApplicationController
  def create
    @item = Item.new(item_params)
    @user = User.find(params[:user_id])
    @item.user = @user 

    if @item.save
      flash[:notice] = "Item was saved!"
      redirect_to @user
    else
      flash.now[:alert] = "Error saving item."
      redirect_to @user
    end
  end

  private
  def item_params
    params.require(:item).permit(:name)
  end
end
