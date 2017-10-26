require 'test_helper'

class Backend::UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @backend_user = backend_users(:one)
  end

  test "should get index" do
    get backend_users_url
    assert_response :success
  end

  test "should get new" do
    get new_backend_user_url
    assert_response :success
  end

  test "should create backend_user" do
    assert_difference('Backend::User.count') do
      post backend_users_url, params: { backend_user: {  } }
    end

    assert_redirected_to backend_user_url(Backend::User.last)
  end

  test "should show backend_user" do
    get backend_user_url(@backend_user)
    assert_response :success
  end

  test "should get edit" do
    get edit_backend_user_url(@backend_user)
    assert_response :success
  end

  test "should update backend_user" do
    patch backend_user_url(@backend_user), params: { backend_user: {  } }
    assert_redirected_to backend_user_url(@backend_user)
  end

  test "should destroy backend_user" do
    assert_difference('Backend::User.count', -1) do
      delete backend_user_url(@backend_user)
    end

    assert_redirected_to backend_users_url
  end
end
