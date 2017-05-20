class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      log_in user
      if user_has_items_to_return?
        flash[:danger] = 'You have items to be returned'
      end
      if is_requested_item_available?
        flash[:success] = "Item that you want is now available"
      end
      redirect_to root_path
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url	
  end

end
