require "test_helper"

class SequencesControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get sequences_edit_url
    assert_response :success
  end

  test "should get update" do
    get sequences_update_url
    assert_response :success
  end

  test "should get create" do
    get sequences_create_url
    assert_response :success
  end

  test "should get shuffle" do
    get sequences_shuffle_url
    assert_response :success
  end
end
