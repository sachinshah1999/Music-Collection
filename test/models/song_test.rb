require 'test_helper'

class SongTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  setup do
    @user = users(:one)
    @genre = genres(:one)
  end

  test 'should save valid song' do

    song = Song.new

    song.user = @user
    song.genre = @genre
    song.title = 'Beat It'
    song.artist = 'Michael Jackson'
    song.album = 'Thriller'
    song.year = 1982

    song.save
    assert song.valid?
  end

  test 'should not save duplicate song title' do

    song1 = Song.new
    song1.user = @user
    song1.genre = @genre
    song1.title = 'Every Breath You Take'
    song1.artist = 'The Police'
    song1.album = 'Synchronicity'
    song1.year = 1983
    song1.save
    assert song1.valid?

    song2 = Song.new
    song2.user = @user
    song2.genre = @genre
    song2.title = 'Every Breath You Take'
    song2.artist = '​a-ha'
    song2.album = 'Hunting High and Low'
    song2.year = 1985
    song2.save
    refute song2.valid?
  end

  test 'should not save empty song title' do
    song = Song.new

    song.user = @user
    song.genre = @genre
    song.title = ''
    song.artist = 'Bon Jovi'
    song.album = 'Slippery When Wet'
    song.year = 1986
    refute song.valid?
  end
end
