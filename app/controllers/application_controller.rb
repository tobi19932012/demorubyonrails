class ApplicationController < ActionController::Base
  helper_method [:recent_news, :last_viewed_news]
  # before_filter :show_news_layout
  protect_from_forgery with: :exception
  before_action :show_category_layout
  before_action :show_news_layout

  def recent_news
    @recent_news ||= RecentNews.new cookies
  end

  def last_viewed_news
    # recent_news
    # byebug
    recent_news.reverse.second
  end





  private

  def show_category_layout
    @frontend_category_index = Backend::Category.where(status: true).all
    # byebug
  end

  def show_news_layout
    # if params[:q]
      @search = Backend::News.search(params[:q])
    end
    # @search_news_index = @search.where(status: true).all
    # byebug
  # protected
  # private
  # private

  # def current_user
  #   @current_user ||= User.find(session[:user_id]) if session[:user_id]
  # end
  # helper_method :current_user



  protected

  def after_sign_in_path_for(resource)
    frontend_root_path
  end

  def after_sign_out_path_for(resource)
    new_user_session_path
  end
end
