require 'test_helper'

class Backend::CategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @backend_category = backend_categories(:one)
  end

  test "should get index" do
    get backend_categories_url
    assert_response :success
  end

  test "should get new" do
    get new_backend_category_url
    assert_response :success
  end

  test "should create backend_category" do
    assert_difference('Backend::Category.count') do
      post backend_categories_url, params: { backend_category: {  } }
    end

    assert_redirected_to backend_category_url(Backend::Category.last)
  end

  test "should show backend_category" do
    get backend_category_url(@backend_category)
    assert_response :success
  end

  test "should get edit" do
    get edit_backend_category_url(@backend_category)
    assert_response :success
  end

  test "should update backend_category" do
    patch backend_category_url(@backend_category), params: { backend_category: {  } }
    assert_redirected_to backend_category_url(@backend_category)
  end

  test "should destroy backend_category" do
    assert_difference('Backend::Category.count', -1) do
      delete backend_category_url(@backend_category)
    end

    assert_redirected_to backend_categories_url
  end
end
