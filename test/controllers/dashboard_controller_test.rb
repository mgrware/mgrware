require 'test_helper'

class DashboardControllerTest < ActionController::TestCase
  test "should get blog_new" do
    get :blog_new
    assert_response :success
  end

end
