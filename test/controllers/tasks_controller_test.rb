require "test_helper"
require "securerandom"
class TasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:kaneki)
    @category = categories(:one)
    @task = tasks(:one)
    sign_in @user
  end

  test 'should get all tasks' do
    get category_tasks_path(@category)

    assert_response :success
  end
  test 'should get new task form template' do
    get new_category_task_path(@category)

    assert_response :success
  end
  test 'should create new task' do
    assert_difference 'Task.count', 1 do
      post category_tasks_path(@category), params:{task: {title: 'Create New Task', description: 'description description', deadline: Date.today}}
      assert_response :redirect
    end
    follow_redirect!
    assert_response :success
  end
  test 'should show selected task' do
    get category_task_path(@category, @task)
    assert_response :success

  end
  test 'should show edit form template of selected task' do
    get edit_category_task_path(@category, @task)
    assert_response :success
  end

  test 'should update selected task' do
    put category_task_path(@category, @task), params:{task: {title: 'Create New Task', description: 'description description', deadline: Date.today}}
    assert_response :redirect
  end

  test 'should delete selected task' do
    assert_difference '@category.tasks.count', -1 do
      delete category_task_path(@category, @task)
      assert_response :redirect
  end
  end
end
