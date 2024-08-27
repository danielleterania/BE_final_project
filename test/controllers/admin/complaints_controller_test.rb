require "test_helper"

class Admin::ComplaintsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_complaints_index_url
    assert_response :success
  end
end
