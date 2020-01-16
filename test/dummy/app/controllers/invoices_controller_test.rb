require 'test_helper'

class InvoicesControllerTest < ActionController::TestCase
   test "Test Should be Completed" do
   	get :index
   	assert_response :success
   end

	end