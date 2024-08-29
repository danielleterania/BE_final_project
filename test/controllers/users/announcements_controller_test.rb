require "test_helper"

class Users::AnnouncementsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get users_announcements_index_url
    assert_response :success
  end
end
