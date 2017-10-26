class Api::V1::NewsController < Api::BaseController
  skip_before_action :verify_authenticity_token
  # hiển thị news , có phân trang
  # Đường dẫn [GET]: /api/v1/get_news_pages?page=[:page]
  def get_news_pages
    @news = Backend::News.all
    @news = @news.page(params[:page])

    render json: {news:
                      [ @news ,
                        page: params[:page]
                      ] }
  end

  # hiển thị danh sách news theo category, có phân trang
  # Đường dẫn [GET]: /api/v1/get_news_categories_pages?id=[:id]&page=[:page]
  def get_news_categories_pages
    @categories = Backend::Category.find(params[:id])
    @news = @categories.news.where(status: true).all
    @news = @news.page(params[:page])
    # byebug
    render json:{ category:  @categories.id , page: params[:page],  news: @news }

  end

  # Thêm mới news
  # Đường dẫn [POST]: /api/v1/post_create_news
  def post_create_news
    @news = Backend::News.new(create_news_params)
    if @news.save
      # byebug
    render json: {news:
                      {id: @news.id,
                       title: @news.title ,
                       category_id: @news.category_id ,
                       news_details: @news.news_details ,
                       status: @news.status ,
                       number_view: @news.number_view ,
                      }}
    else
      render json:  @news.errors
    end
  end

  # sửa thông tin news
  # Đường dẫn [POST]: /api/v1/post_udate_news
  def post_update_news
    @news = Backend::News.find(params[:id])
    if @news.update(update_news_params)
      render json: {news:
                        { id: @news.id ,
                          title: @news.title ,
                          category_id: @news.category_id ,
                          news_details: @news.news_details ,
                          status: @news.status ,
                          number_view: @news.number_view ,
                      }}
    else
      render json:  @news.errors
    end
  end

  private
    def create_news_params
      params.permit(:title, :id , :category_id , :news_details, :status , :number_view)
    end

    def update_news_params
      params.permit(:title , :category_id , :news_details, :status , :number_view)
    end
end
