require "test_helper"

class TracksControllerTest < ActionDispatch::IntegrationTest
  test "should get update" do
    get tracks_update_url
    assert_response :success
  end

  test "should get index" do
    get tracks_index_url
    assert_response :success
  end
end
