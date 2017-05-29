require 'test_helper'
include SessionsHelper

class SessionsLogInTest < ActionDispatch::IntegrationTest


  def setup
    new_test_user
  end

  test "shoud get valid log in and logout" do
    get '/'
    log_in_test_user
    assert 'logged_in?'
    log_out
    assert 'current_user.nil'
  end

end
