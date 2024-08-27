require "test_helper"

class Admin::UserApprovalsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_user_approvals_index_url
    assert_response :success
  end
end
