require "test_helper"

class CategoryTest < ActiveSupport::TestCase
  setup do 
    @category = categories(:one)
    @user = users(:kaneki)
    sign_in @user
  end
  test 'should not save without category_name' do
    category = @user.categories.build
    assert_not category.save, 'Category saved without category_name'
  end
  test 'category should save' do
    category = @user.categories.build(name: "Health & Fitness")
    assert category.save, 'Category did not save'
  end

  test'category should update' do
    category = @category
    category.name = "Health Fitness"
    category.user_id = @user.id
    assert category.save, 'Category did not save'
  end
end
