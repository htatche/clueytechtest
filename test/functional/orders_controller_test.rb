require 'test_helper'

class OrdersControllerTest < ActionController::TestCase
  test "should get search" do
    get :search
    assert_response :success
  end

  test "should get lookup" do
    get :lookup
    assert_response :success
  end

end
