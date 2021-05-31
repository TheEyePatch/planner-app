require "test_helper"

class HomeControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  test "should get index template tasks" do
    get root_path
    assert_response :success
  end
end
