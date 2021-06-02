require "test_helper"
class CreateTaskTest <  ActionDispatch::IntegrationTest
    setup do
        @user = users(:kaneki)
        @category = categories(:one)
        @task = tasks(:one)
        sign_in @user
    end

    test 'should go to new task form template and able to create  a new tasks' do
        get new_category_task_path(@category)
        assert_response :success

        assert_difference '@category.tasks.count', 1 do
            post category_tasks_path(@category), params:{task: {title: 'Create New Task', description: 'description description', deadline: Date.today}}
            assert_response :redirect
        end
        follow_redirect!
        assert_response :success
    end

    test 'should go to edit task form template and able to update selected task' do
        get edit_category_task_path(@category, @task)
        assert_response :success

        put category_task_path(@category, @task), params:{task: {title: 'Edit Task', description: 'description description', deadline: Date.today}}
        assert_response :redirect

        follow_redirect!
        assert_response :success
    end

    test 'should delete selected task' do
        get category_tasks_path(@category)
        assert_response :success

        assert_difference '@category.tasks.count', -1 do
            delete category_task_path(@category, @task)
            assert_response :redirect
        end
        follow_redirect!
        assert_response :success
    end
end