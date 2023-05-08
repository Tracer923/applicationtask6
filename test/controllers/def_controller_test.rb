require "test_helper"

class DefControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get def_create_url
    assert_response :success
  end
end
