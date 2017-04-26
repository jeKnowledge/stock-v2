class ItemsController < ApplicationController

  def new
  end

  def create
  end

  def index
    @items = Item.all
    @cuser_id = current_user.id
  end

  def edit
    @item = Item.find(params[:id])

  end

  def update
    @item = Item.find(params[:id])
    @item.state = !@item.state
     
    if @item.state
      @item.user_id = current_user.id
    else
      @item.user_id = 1
    end
    if @item.update_attributes(item_params)
      flash[:success] = "You aquired the item"
      redirect_to '/items' 
    else
      render 'edit'
    end
  end

  private

  def item_params
    params.permit(:state, :user_id)
  end
end
