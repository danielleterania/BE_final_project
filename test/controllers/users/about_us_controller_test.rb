require "test_helper"

class Users::AboutUsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get users_about_us_show_url
    assert_response :success
  end
end
