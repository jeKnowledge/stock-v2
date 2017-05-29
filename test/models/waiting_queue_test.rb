require 'test_helper'
include SessionsHelper

class WaitingQueueTest < ActiveSupport::TestCase

  test "Create and delete WaitingQueue" do
    new_test_user
    new_test_item
    new_waiting_queue_test(@user.id, @item.id)
    assert_not WaitingQueue.where(id: @wq.id).nil?
  end

end
