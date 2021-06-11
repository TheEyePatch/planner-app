require "test_helper"

class TaskTest < ActiveSupport::TestCase
  setup do
    @category = categories(:one)
  end

  test 'should save' do
    task = Task.new
    task.title = 'Sports'
    task.description = 'one two three four'
    task.category_id = @category.id
    task.deadline = Date.current
    assert task.save, 'Task did not save'
  end

  test 'should not save without title' do
    task = Task.new
    # task.title = 'Sports'
    task.description = 'one two three four'
    task.category_id = @category.id
    
    assert_not task.save, 'Saved without task title'
  end

  test 'should save desciption length more than 10' do
    task = Task.new
    task.title = 'Sports'
    task.deadline = Date.today
    task.description = 'one two three asdasd'
    task.category_id = @category.id
    
    assert task.save, 'Task did not save'
  end

  test 'should not save Task without date' do
    task = Task.new
    task.title = 'Sports'
    task.description = 'one two three'
    task.category_id = @category.id
    
    assert_not task.save, 'Task saved without date'
  end
  test 'should not save Task when date is in the past' do
    task = Task.new
    task.title = 'Sports'
    task.description = 'one two three'
    task.category_id = @category.id
    task.deadline = Date.current.yesterday
    assert_not task.save, 'Task saved with past date'
  end
end
