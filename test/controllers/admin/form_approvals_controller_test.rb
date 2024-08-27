require "test_helper"

class Admin::FormApprovalsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_form_approvals_index_url
    assert_response :success
  end
end
