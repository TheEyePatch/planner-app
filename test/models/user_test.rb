require "test_helper"

class UserTest < ActiveSupport::TestCase
  setup do
    @user = users(:kaneki)
  end

  test 'should create new user'do
  user = User.new
  user.email = 'email@email.com'
  user.first_name = 'kaneki'
  user.last_name = 'ken'
  user.password = '1234567'


  assert user.save, user.errors.full_messages
  end

  test 'should not save user without password' do
    user = User.new
    user.email = 'email@email.com'
    user.first_name = 'kaneki'
    user.last_name = 'ken'
        
    assert_not user.save, 'User saved without password'
  end

  test 'should not save user when email is already in use' do
    user = User.new
    user.email = 'kaneki@email.com'
    user.password = '1234567'
    user.first_name = 'kaneki'
    user.last_name = 'ken'
    
    assert_not user.save, user.errors.full_messages
  end

  test 'should not save new user without first_name'do
  user = User.new
  user.email = 'email@email.com'
  user.last_name = 'ken'
  user.password = '1234567'

  assert_not user.save, 'User saved without first_name'
  end

  test 'should not save new user without last_name'do
  user = User.new
  user.email = 'email@email.com'
  user.first_name = 'kaneki'
  user.password = '1234567'

  assert_not user.save, 'User saved without last_name'
  end
end
