require "test_helper"

class CategoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  setup do 
    @category = categories(:one)
  end
  test 'should not save without category_name' do
    category = Category.new
    assert_not category.save, 'Category saved without category_name'
  end
  test 'category should save' do
    category = Category.new
    category.category_name = "Health & Fitness"
    assert category.save, 'Category did not save'
  end

  test'category should update' do
    category = @category
    category.category_name = "Health Fitness"
    assert category.save, 'Category did not save'
  end
end
