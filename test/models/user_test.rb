require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test 'shoud not save invalid user' do
    user = User.new
    user.save
    refute user.valid?
  end

  test 'should save valid user' do
    user = User.new
    user.email = 'sachin@example.com'
    user.password = 'password'
    user.save
    assert user.valid?
  end

  test 'should not save user with password less than 6' do
    user = User.new
    user.email = 'sachin@example.com'
    user.password = 'p'
    user.save
    refute user.valid?
  end

  test 'should not save user with incorrect confirmation password' do
    user = User.new
    user.email = 'sachin@example.com'
    user.password = 'p'
    user.password_confirmation = 'pdas'
    user.save
    refute user.valid?
  end

end
