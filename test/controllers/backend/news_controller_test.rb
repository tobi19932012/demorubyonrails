require 'test_helper'

class Backend::NewsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @backend_news = backend_news(:one)
  end

  test "should get index" do
    get backend_news_index_url
    assert_response :success
  end

  test "should get new" do
    get new_backend_news_url
    assert_response :success
  end

  test "should create backend_news" do
    assert_difference('Backend::News.count') do
      post backend_news_index_url, params: { backend_news: {  } }
    end

    assert_redirected_to backend_news_url(Backend::News.last)
  end

  test "should show backend_news" do
    get backend_news_url(@backend_news)
    assert_response :success
  end

  test "should get edit" do
    get edit_backend_news_url(@backend_news)
    assert_response :success
  end

  test "should update backend_news" do
    patch backend_news_url(@backend_news), params: { backend_news: {  } }
    assert_redirected_to backend_news_url(@backend_news)
  end

  test "should destroy backend_news" do
    assert_difference('Backend::News.count', -1) do
      delete backend_news_url(@backend_news)
    end

    assert_redirected_to backend_news_index_url
  end
end
