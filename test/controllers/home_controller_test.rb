require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test "should get loggedouthome" do
    get :loggedouthome
    assert_response :success
  end

end
