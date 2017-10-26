require 'test_helper'

class Backend::CommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @backend_comment = backend_comments(:one)
  end

  test "should get index" do
    get backend_comments_url
    assert_response :success
  end

  test "should get new" do
    get new_backend_comment_url
    assert_response :success
  end

  test "should create backend_comment" do
    assert_difference('Backend::Comment.count') do
      post backend_comments_url, params: { backend_comment: {  } }
    end

    assert_redirected_to backend_comment_url(Backend::Comment.last)
  end

  test "should show backend_comment" do
    get backend_comment_url(@backend_comment)
    assert_response :success
  end

  test "should get edit" do
    get edit_backend_comment_url(@backend_comment)
    assert_response :success
  end

  test "should update backend_comment" do
    patch backend_comment_url(@backend_comment), params: { backend_comment: {  } }
    assert_redirected_to backend_comment_url(@backend_comment)
  end

  test "should destroy backend_comment" do
    assert_difference('Backend::Comment.count', -1) do
      delete backend_comment_url(@backend_comment)
    end

    assert_redirected_to backend_comments_url
  end
end
