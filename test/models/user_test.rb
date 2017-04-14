require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  def setup
    @user = User.new(name: "ExampleUser", 
		     email:"exampleuser@example.com", 
		     password: "zyxwv",
		     password_confirmation: "zyxwv")
  end

  test "should be valid" do
    assert @user.valid?
  end

  #name

  test "name should be present" do
    assert @user.name = " "
    assert_not @user.valid?
  end

  test "name should not be too short" do 
    @user.name = "z" * 3
    assert_not @user.valid?
  end

  test "name should not be too long" do 
    @user.name = "z" * 31
    assert_not @user.valid?
  end
  
  #email
  
  test "email should be present" do
    @user.email = " "
    assert_not @user.valid?
  end

  test "email should not be too long" do 
    @user.email = "z" * 255 + "@something.com" 
    assert_not @user.valid?
  end

  test "email should be unique" do 
    duplicate_user = @user.dup
    @user.save
    assert_not duplicate_user.valid? 
  end

  #password

  test "password should be present" do
    @user.password = @user.password_confirmation = " "
    assert_not @user.valid?
  end

  test "password should have a minimum length" do
    @user.password = @user.password_confirmation = "z" * 4
    assert_not @user.valid?
  end
end
