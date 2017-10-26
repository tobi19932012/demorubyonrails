class Frontend::PostNewsController < Frontend::BaseController
  def index
    @post_news_index = Backend::News.where(status: true).order(created_at: :desc)
    @post_news_index = @post_news_index.page(params[:page]).per(10)
  end
end
