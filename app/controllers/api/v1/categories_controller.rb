class Api::V1::CategoriesController < Api::BaseController

  # Hiển thị tất cả danh sách categories trên api
  # Đường dẫn [GET]: /api/v1/get_categories
  def get_categories
    @categories = Backend::Category.where(status: true).all

    render json: { category: @categories}
  end


end
