module SessionsHelper

  #Logs in a user
  def log_in(user)
    session[:user_id] = user.id
  end

  # Returns the current logged-in user (if any)
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  # Returns true if the user is logged in, false otherwise
  def logged_in?
    !current_user.nil?
  end

  # Logs out the current user
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

  #returns true if user is an admin
  def admin_user?
    current_user.admin
  end

  #returns true if user has any item
  def user_items?
    !current_user.items.empty?
  end

  #returns true if there is any item available
  def available_items
    flag = false
    items = Item.all
    items.each do |i|
      if !i.user_id
        flag = true
        break
      end
    end
    flag
  end

  #returns true if there is any item not available
  def not_available_items
    flag = false
    items = Item.all
    items.each do |i|
      if i.user_id  && i.user_id != current_user.id
        flag = true
        break
      end
    end
    flag
  end

  #returns true if user has items to return
  def user_has_items_to_return?
    if user_items?
      current_user.items.each do |i|
        if i.deadline < DateTime.now
          return true
        end
      end
    end
    false
  end

  #return true if item in waiting list is available to the current user
  def item_is_available?
    waiting_queue = WaitingQueue.all
    flag = false

    waiting_queue.each do |w|
      if w.user_id == current_user.id && !Item.find(w.item_id).state
        flag = true
        w.destroy
      end
    end
    flag
  end
end
