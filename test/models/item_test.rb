require 'test_helper'
include SessionsHelper

class ItemTest < ActiveSupport::TestCase

  def setup
    new_test_item
    new_test_user 
  end

  test "new item" do
    assert Item.find(@item.id)
  end

  test "delete item" do
    assert Item.find(@item.id)
    @item.destroy 
    assert_not Item.where(id: @item.id).any?
  end

  test "aquire and return item" do
    @item.user_id = @item.id
    assert @item.user_id?
    @item.user_id = nil
    assert @item.user_id.nil?
  end


end
