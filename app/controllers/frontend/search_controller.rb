class Frontend::SearchController < Frontend::BaseController
  def index
    @search_news_index = @search.result(:distinct => true).where(status: true)
    @search_news_index = @search_news_index.page(params[:page]).per(10)

  end
end
