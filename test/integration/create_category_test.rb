require "test_helper"

class CreateCategoryTest < ActionDispatch::IntegrationTest
    setup do
        @user = users(:kaneki)
        @category = categories(:one)
        sign_in @user
    end
    test 'should go to new category form template and able to create new category' do
        get new_category_path
        assert_response :success

        assert_difference 'Category.count', 1 do
            post categories_path, params: {category: {name: 'Fitness'}}
            assert_response :redirect
        end

        follow_redirect!
        assert_response :success
    end

    test 'should got to edit category template and update selected category' do
        get edit_category_path(@category)
        assert_response :success
       
        put category_path(@category), params: {category: {name: 'Fitness'}}
        assert_response :redirect
        
        follow_redirect!
        assert_response :success
    end

    test 'should delete selected category' do

        get categories_path
        assert_response :success

        assert_difference 'Category.count', -1 do
            delete category_path(@category)
            assert_response :redirect
        end
        follow_redirect!
        assert_response :success
    end
end