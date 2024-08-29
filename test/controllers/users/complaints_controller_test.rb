require "test_helper"

class Users::ComplaintsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get users_complaints_create_url
    assert_response :success
  end

  test "should get index" do
    get users_complaints_index_url
    assert_response :success
  end
end
