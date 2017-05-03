class ItemsController < ApplicationController

  def new
    @item = Item.new
    @number = 0
    if !logged_in?
      redirect_to root_path
    end
  end

  def create
    @item = Item.new(item_params_new)

    (@item.amount).times do |x|
      @item = Item.new(item_params_new)
      @item.save
    end

    if @item.save
      flash[:success] = "Item created"
      redirect_to '/new_item'
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

  def your_items
    t = 0
    @non_repetetive_items = Hash.new
    @items = Item.all
    @items.each do |i_1|
      if !hash_has_name?(@non_repetetive_items, i_1) && i_1.state && current_user.id == i_1.user_id
        @items.each do |i_2| 
          if i_1.name == i_2.name && i_2.state && current_user.id == i_2.user_id
            t += 1
          end
        end
        @non_repetetive_items[i_1] = t
      end
      t = 0
    end
    if logged_in?
      @cuser_id = current_user.id
      @cuser_admin = current_user.admin
    else
      redirect_to root_path
    end
  end

  def items_not_available
    t = 0
    @non_repetetive_items = Hash.new
    @items = Item.all
    @items.each do |i_1|
      if !hash_has_name?(@non_repetetive_items, i_1) && i_1.state && current_user.id != i_1.user_id
        @items.each do |i_2| 
          if i_1.name == i_2.name && i_2.state && current_user.id != i_2.user_id 
            t += 1
          end
        end
        @non_repetetive_items[i_1] = t
      end
      t = 0
    end
    if logged_in?
      @cuser_id = current_user.id
      @cuser_admin = current_user.admin
    else
      redirect_to root_path
    end
  end

  def items_available
    t = 0
    @non_repetetive_items = Hash.new
    @items = Item.all
    @items.each do |i_1|
      if !hash_has_name?(@non_repetetive_items, i_1) && !i_1.state
        @items.each do |i_2| 
          if i_1.name == i_2.name && !i_2.state
            t += 1
          end
        end
        @non_repetetive_items[i_1] = t
      end
      t = 0
    end
    if logged_in?
      @cuser_id = current_user.id
      @cuser_admin = current_user.admin
    else
      redirect_to root_path
    end
  end

  def items_available
    t = 0
    @non_repetetive_items = Hash.new
    @items = Item.all
    @items.each do |i_1|
      if !hash_has_name?(@non_repetetive_items, i_1) && !i_1.state
        @items.each do |i_2| 
          if i_1.name == i_2.name && !i_2.state
            t += 1
          end
        end
        @non_repetetive_items[i_1] = t
      end
      t = 0
    end
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

      if @item.state
        redirect_to '/items_available' 
      else 
        redirect_to '/your_items'
      end
    else
      render 'edit'
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    flash[:success] = "Item was deleted"
    redirect_to '/items_available'
  end

  private

  def item_params_new
    params.require(:item).permit(:name, :state, :user_id, :amount)
  end
  def item_params_update
    params.permit(:name,:state, :user_id)
  end
end
