require "test_helper"

class HomeownersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get homeowners_index_url
    assert_response :success
  end
end
