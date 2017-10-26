class Frontend::CategoriesController < Frontend::BaseController
  # caches_page :show
  def show
    @frontend_category_show = Backend::Category.where(status: true).find(params[:id])

    @frontend_news = @frontend_category_show.news.where(status: true).all
    @frontend_news = @frontend_news.page(params[:post_category_news_page]).per(10)

    # byebug
  end
end
