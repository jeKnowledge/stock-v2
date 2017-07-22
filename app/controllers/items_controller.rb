class ItemsController < ApplicationController

  def new
    @item = Item.new
    @number = 0
    if !logged_in? || !admin_user?
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
      if !hash_has_name_not_available?(@non_repetetive_items, i_1) && i_1.state && current_user.id != i_1.user_id
        @items.each do |i_2| 
          if i_1.name == i_2.name && i_2.state && current_user.id != i_2.user_id && i_1.user_id == i_2.user_id
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

  def setup_aquire
    @item = Item.find(params[:id])
  end

  def setup_return
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    if !logged_in?
      redirect_to root_path
    end
  end


  def update
    @item_amount = item_params_new[:amount]
    @item = Item.find(params[:id])
    @item_state = @item.state
    k = 0

    Item.all.each do |i|
      if (i.name.eql?@item.name and @item_state == i.state) 
        if !i.state 
          i.user_id = current_user.id
          i.deadline = DateTime.now
        else
          i.user_id = nil
          i.deadline = nil
        end
        i.state = !i.state
        i.update_attributes(item_params_update)
        k += 1
      end
      break if k >= @item_amount.to_f
    end

    if !@item.state
      flash[:success] = "You aquired the itens"
      redirect_to '/items_available' 
    else 
      flash[:success] = "You returned the item"
      redirect_to '/your_items'
    end
  end

  def setup_destroy
    @item = Item.find(params[:id])
  end

  def destroy
    @item_amount = item_params_new[:amount]
    @item = Item.find(params[:id])
    @item_name = @item.name
    j = 0

    Item.all.each do |i|
      if @item_name.eql?i.name
        i.destroy
        j += 1
      end
      break if j >= @item_amount.to_f
    end

    flash[:success] = j
    redirect_to items_available_path
  end

  private

  def item_params_new
    params.require(:item).permit(:name, :state, :user_id, :amount)
  end

  def item_params_update
    params.permit(:name,:state, :user_id)
  end

  def item_params_destroy
    params.require(:item).permit(:amount)

  end
end
