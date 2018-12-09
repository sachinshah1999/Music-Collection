require 'test_helper'

class SongsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  # called before every single test
  setup do
    @song = songs(:one)
    @genre = genres(:one)
    @user = users(:one)
    sign_in @user
  end

  # called after every single test
  teardown do
    # when controller is using cache it may be a good idea to reset it afterwards
    Rails.cache.clear
  end

  test "should get index" do
    get songs_url
    assert_response :success

    assert_select 'title', 'Music Collection'
  end

  test 'should get new song' do
    get new_song_path
    assert_response :success

    assert_select 'h1', 'New Song'
  end

  test 'should get edit song' do
    get edit_song_path(@song)
    assert_response :success

    assert_select 'h1', 'Edit Song'
  end

  test "should create song" do
  assert_difference('Song.count') do
    post songs_path, params: { song: { user_id: @user, genre_id: @genre, title: @song.title } }
  end
  assert_redirected_to root_path
  assert_equal 'Song was successfully created.', flash[:notice]
end

  test 'should show song' do
    get song_url(@song)
    assert_response :success
end

  test 'should destroy song' do
  assert_difference('Song.count', -1) do
    delete song_url(@song)
  end
  assert_redirected_to root_path
end

  test 'should update song' do
    patch song_url(@song), params: { song: { title: "updated" } }

    assert_redirected_to song_path(@song)
     #Reload association to fetch updated data and assert that title is updated.
    @song.reload
    assert_equal "updated", @song.title
  end

  test 'should get contact' do
    get contact_path
    assert_response :success

    assert_select 'h1', 'Contact Us'
  end

  test 'should post request contact but no email' do
    post request_contact_path

    #assert_response :redirect
    assert_not_empty flash[:alert]
    assert_nil flash[:notice]
  end

  test 'should post request contact' do
    post request_contact_path, params: { email: "sachin@me.com",
      name: "Sachin",
      telephone: "1234567890",
      message: "Hello" }

    assert_response :redirect
    #assert_nil flash[:alert]
    #assert_not_empty flash[:notice]
  end
end
