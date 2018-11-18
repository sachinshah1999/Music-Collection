require 'test_helper'

class SongsControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test "should get index" do
    get songs_url
    assert_response :success
  end
end
