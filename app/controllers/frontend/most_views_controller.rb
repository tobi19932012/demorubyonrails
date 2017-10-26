class Frontend::MostViewsController < Frontend::BaseController

    def index
      @most_views = Backend::News.where(status: true).order(number_view: :desc)
      @most_views = @most_views.page(params[:page]).per(10)
    end
end
