require "test_helper"

class HomeControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:kaneki)
    sign_in @user
  end

  test "should get index template tasks" do
    get root_path
    assert_response :success
  end
end
