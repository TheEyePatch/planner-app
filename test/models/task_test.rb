require "test_helper"

class TaskTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test 'should not save without title' do
    category = Category.new
    category.category_name = 'Sports'
    category.save

    task = Task.new
    # task.title = 'Sports'
    task.description = 'one two three four'
    task.category_id = category.id
    
    assert_not task.save, 'Saved without task title'
  end

  test 'should save desciption length more than 10' do
    category = Category.new
    category.category_name = 'Sports'
    category.save

    task = Task.new
    task.title = 'Sports'
    task.deadline = Date.today
    task.description = 'one two three'
    task.category_id = category.id
    
    assert task.save, 'Task did not save'
  end

  test 'should not save Task without date' do
    category = Category.new
    category.category_name = 'Sports'
    category.save

    task = Task.new
    task.title = 'Sports'
    task.description = 'one two three'
    task.category_id = category.id
    
    assert_not task.save, 'Task saved without date'
  end
end
