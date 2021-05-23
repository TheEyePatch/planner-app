require "test_helper"

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  setup do
    @category = categories(:one)
  end

  test 'should get all categories' do
    get categories_path

    assert_response :success
  end
  test 'should get new user' do
    get new_category_path

    assert_response :success
  end

  test 'should post new category' do
    post categories_path, params:{category: {category_name: 'Sports'}}

    assert_response :redirect
  end

  test 'should show selected category' do
    get category_path(@category)
    assert_response :success

  end
  test 'should go to edit form template' do
    get edit_category_path(@category)
    assert_response :success

  end

  test 'should update selected category' do
    put category_path(@category), params: {category: {category_name: 'Spot'}}

    assert_response :redirect
  end

  test 'should delete selected category' do
    delete category_path(@category)
    assert_response :redirect

  end

  
end
