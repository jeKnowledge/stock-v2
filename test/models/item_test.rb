require 'test_helper'

class ItemTest < ActiveSupport::TestCase

	def setup
		@item = Item.new(
			name: "example item", 
			state: true
		)
	end

	test "should be valid" do
		assert @item.valid?
	end

	#name

	test "name should be present" do
		@item.name = nil
		assert_not @item.valid?
	end

	test "name should not be too short" do
		@item.name = "z" * 4
		assert_not @item.valid?
	end

	test "name should not be too long" do
		@item.name = "z" * 256
		assert_not @item.valid?
	end	

end
