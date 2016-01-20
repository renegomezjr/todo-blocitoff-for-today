class ItemsController < ApplicationController
  def create
    @item = Item.new(item_params)
    @user = User.find(params[:user_id])
    @item.user = @user

    if @item.save
      flash[:notice] = "Item was saved!"
      redirect_to @user
    else
      flash[:alert] = "Error saving item."
      redirect_to @user
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @item = @user.items.find(params[:id])

    if @item.destroy
      flash[:notice] = "You did it! You are the master of this list."
    else
      flash[:alert] = "Something went wrong. Try again."
    end

    respond_to do |format|
      format.html
      format.js
    end
  end



  private
  def item_params
    params.require(:item).permit(:name)
  end
end
