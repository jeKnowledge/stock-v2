class ItemsController < ApplicationController

  def new
    @item = Item.new
    if !logged_in?
      redirect_to root_path
    end
  end

  def create
    @item = Item.new(item_params_new)
    @item.state = false
    @item.user_id = 1

    if @item.save
      redirect_to items_path
    else
      render 'new'
    end
  end

  def index
    @items = Item.all
    if logged_in?
      @cuser_id = current_user.id
      @cuser_admin = current_user.admin
    else
      redirect_to root_path
    end
  end

  def edit
    @item = Item.find(params[:id])
    if !logged_in?
      redirect_to root_path
    end
  end


  def update
    @item = Item.find(params[:id])
    @item.state = !@item.state

    if @item.state
      @item.user_id = current_user.id
    else
      @item.user_id = nil
    end
    if @item.update_attributes(item_params_update)
      if @item.state
        flash[:success] = "You aquired the item"
      else 
        flash[:success] = "You returned the item"
      end
      redirect_to '/items' 
    else
      render 'edit'
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to items_path
  end

  private

  def item_params_new
    params.require(:item).permit(:name, :state, :user_id)
  end
  def item_params_update
    params.permit(:name,:state, :user_id)
  end
end
