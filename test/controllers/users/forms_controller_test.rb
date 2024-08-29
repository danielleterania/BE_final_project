require "test_helper"

class Users::FormsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get users_forms_index_url
    assert_response :success
  end

  test "should get show" do
    get users_forms_show_url
    assert_response :success
  end

  test "should get create" do
    get users_forms_create_url
    assert_response :success
  end
end
