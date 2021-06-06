require "test_helper"

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @category = categories(:one)
    @user = users(:kaneki)
    sign_in @user
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
    assert_difference 'Category.count', 1 do
      post categories_path, params: {category: {category_name: 'Fitness'}}
      assert_redirected_to categories_path
    end
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
    put category_path(@category), params: {category: {category_name: 'Sports'}}

    assert_response :redirect
  end

  test 'should delete selected category' do
    assert_difference 'Category.count', -1 do
      delete category_path(@category)
      assert_response :redirect
    end
  end

  
end
