require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
	
  def setup
    new_test_user
  end

  test "redict if not have permissions" do
    log_in_test_user
    #while logged_in
    get '/users'
    assert_redirected_to '/'
    get '/new_item'
    assert_redirected_to '/'

    #while logged_out
    log_out 
    get_page_redirect_to('/users', '/')
    get_page_redirect_to('/items_available', '/')
    get_page_redirect_to('/items_not_available', '/')
    get_page_redirect_to('/your_items', '/')
  end

end
