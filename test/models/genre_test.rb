require 'test_helper'

class GenreTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test 'should save valid genre' do
    genre = Genre.new
    genre.name = 'Pop'
    genre.save
    assert genre.valid?
  end

  test 'shoud not save valid genre' do
    genre = Genre.new
    genre.name = ''
    genre.save
    refute genre.valid?
  end
end
