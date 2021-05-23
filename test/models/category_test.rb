require "test_helper"

class CategoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test 'should not save without category_name' do
    category = Category.new
    assert_not category.save, 'Category saved without category_name'
  end
end
