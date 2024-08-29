require "test_helper"

class Users::BylawsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get users_bylaws_show_url
    assert_response :success
  end
end
