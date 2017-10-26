class Backend::NewsController < Backend::BaseController
  before_action :set_backend_news, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token

  # GET /backend/news
  # GET /backend/news.json
  def index

    @search = Backend::News.order(created_at: :desc).search(params[:q])
    @backend_news = @search.result(:distinct => true)
    @backend_news = @backend_news.page(params[:page])
  end

  # GET /backend/news/1
  # GET /backend/news/1.json
  def show
  end

  # GET /backend/news/new
  def new
    @backend_news = Backend::News.new
    @backend_category = Backend::Category.all.map{|c| [ c.name, c.id ] }
    # @categories = Category.all.map{|c| [ c.name, c.id ] }
    # byebug
  end

  # GET /backend/news/1/edit
  def edit
    @backend_category = Backend::Category.all.map{|c| [ c.name, c.id ] }
  end

  # POST /backend/news
  # POST /backend/news.json
  def create

    @backend_category = Backend::Category.find(params[:category_id])
    @backend_news = @backend_category.news.create(backend_news_params)
    # @backend_news.category_id = params[:category_id]
    # @backend_news = Backend::Category.news.create
    # byebug
    respond_to do |format|
      if @backend_news.save
        format.html { redirect_to backend_news_index_path, notice: 'News was successfully created.' }
        format.json { render :show, status: :created, location: @backend_news }
      else
        format.html { render :new }
        format.json { render json: @backend_news.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /backend/news/1
  # PATCH/PUT /backend/news/1.json
  def update

    @backend_news= Backend::News.find(params[:id])
    @backend_category= Backend::Category.find(params[:category_id])
    @backend_news.category_id = @backend_category.id
    # @backend_category = Backend::Category.find(params[:category_id])
    # byebug
    # @backend_news = @backend_category.news.update(backend_news_params)
    respond_to do |format|
      if @backend_news.update(backend_news_params)
        format.html { redirect_to backend_news_index_path, notice: 'News was successfully updated.' }
        format.json { render :show, status: :ok, location: @backend_news }
      else
        format.html { render :edit }
        format.json { render json: @backend_news.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /backend/news/1
  # DELETE /backend/news/1.json
  def destroy
    # @backend_news= @backend_news.comments
    # byebug
    @backend_news.destroy
    respond_to do |format|
      format.html { redirect_to backend_news_index_url, notice: 'News was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def update_status
    @backend_news = Backend::News.find(update_status_params[:news_id])
    @backend_news.status = !@backend_news.status
     @backend_news.update(status: @backend_news.status)
      # redirect_to backend_news_index_url
      respond_to do |format|
        format.json { render json:  {id: @backend_news.id, status: @backend_news.status }}
      end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_backend_news
      @backend_news = Backend::News.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def backend_news_params
      params.require(:backend_news).permit!
    end

    def update_status_params
      params.permit!
    end
end
