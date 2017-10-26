class Frontend::NewsController < Frontend::BaseController
  # after_action :create_number_news
  def show
    @frontend_news_details = Backend::News.find(params[:id])
    recent_news.push @frontend_news_details
    @relation_news_cat = @frontend_news_details.category
    @relation_cat_news = @relation_news_cat.news.order("RAND()").where.not(id: @frontend_news_details.id)
    # byebug
    @frontend_news_details.number_view = @frontend_news_details.number_view + 1
    @frontend_news_details.save
    # byebug
    # @frontend_new_details = Backend::News.find(params[:id])
    # @news_users = Backend::Comment.user
    # byebug
    @news_comments = @frontend_news_details.comments.where(status: true)
    # @news_users.each do |f|
    #   f.user
    #   byebug
    # end
    # @news_comments = @frontend_news_details.comments.where(status: true).all.group(:user_id, :news_id)
    # byebug
  end

  def create
    @frontend_news_details = Backend::News.find(params[:id])
    # if @frontend_news_details.number_view > 0
    #   @frontend_news_details.number_view = @fronteavend_news_details.number_view - 1
    #   @frontend_news_details.save
    # end


    @comment = @frontend_news_details.comments

    @comment = @comment.create(comment_params)
    # byebug

      @comment.user_id = current_user.id
  # byebug
    respond_to do |format|
      if @comment.save

        format.html { redirect_to frontend_show_news_path(@frontend_news_details), alert: 'Xin vui lòng chờ ban quản trị kiểm duyệt...' }
      end
      end
  end


  private


    def comment_params
      params.permit(:title , :content, :user_id)
    end
end
