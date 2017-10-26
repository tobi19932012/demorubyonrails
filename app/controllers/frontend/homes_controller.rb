class Frontend::HomesController < Frontend::BaseController
  def index
    @frontend_news_index = Backend::News.where(status: true).take(10)
    @frontend_news_number_view = Backend::News.where(status: true).order(number_view: :desc).take(10)
    # byebug
    @frontend_news_cookie = recent_news
    # @frontend_news_cookie.as_json

    # @frontend_news_cookie = recent_news
    # @frontend_news_cookie_count = recent_news.count
    # @frontend_news_cookie = @frontend_news_number_view.page(4).per(2)
    # byebug

  end
end
