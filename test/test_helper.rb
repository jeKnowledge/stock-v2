ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...

  def new_test_user
    @user = User.new(id: 999,
                     name:  "User Example",
                     email: "user@example.com",
                     password:              "password",
                     password_confirmation: "password",
                     admin: false)
  end

  def new_test_item
    @item = Item.new(id: 999, 
                     name: "Item Example",
                     state: false,
                     user_id: nil)
    @item.save
  end

  def new_waiting_queue_test(userid, itemid)
    @wq = WaitingQueue.new(user_id: userid,
                           item_id: itemid)
    @wq.save
  end


  def log_in_test_user
    post login_path, params: { session: { email: @user.email, 
                                          password: @user.password}}
  end

  def get_page_redirect_to(page, red_page)
    get page
    assert_redirected_to red_page
  end

end
