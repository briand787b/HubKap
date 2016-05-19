require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test "should get welcome" do
    get :welcome
    assert_response :success
  end

  test "should get main" do
    get :main
    assert_response :success
  end

end
