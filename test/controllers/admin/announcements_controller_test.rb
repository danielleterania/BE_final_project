require "test_helper"

class Admin::AnnouncementsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_announcements_index_url
    assert_response :success
  end

  test "should get create" do
    get admin_announcements_create_url
    assert_response :success
  end

  test "should get destroy" do
    get admin_announcements_destroy_url
    assert_response :success
  end
end
