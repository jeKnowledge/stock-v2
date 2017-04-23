require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
	
	def setup
		@base_title = "STOCK"
	end

	test "should get home" do
		get	'/' 
		assert_response :success
		assert_select "title", "Home | #{@base_title}"
	end

end
