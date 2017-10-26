class Backend::CategoriesController < Backend::BaseController
  before_action :set_backend_category, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token
  # GET /backend/categories
  # GET /backend/categories.json
  def index
    @search = Backend::Category.order(created_at: :desc).search(params[:q])
    @backend_categories = @search.result(:distinct => true)
    @backend_categories = @backend_categories.page(params[:page])
    # @search = Supervisor.search(params[:q])
    # @supervisors = @search.result(:distinct => true)
  end

  # GET /backend/categories/1
  # GET /backend/categories/1.json
  def show
    @backend_categories = Backend::Category.find(params[:id])
  end

  # GET /backend/categories/new
  def new
    @backend_category = Backend::Category.new
  end

  # GET /backend/categories/1/edit
  def edit
  end

  # POST /backend/categories
  # POST /backend/categories.json
  def create
    @backend_category = Backend::Category.new(backend_category_params)
    # @backend_category.category_id = params[:category_id]
    respond_to do |format|
      if @backend_category.save
        format.html { redirect_to backend_categories_path, notice: 'Category was successfully created.' }
        format.json { render :show, status: :created, location: @backend_category }
      else
        format.html { render :new }
        format.json { render json: @backend_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /backend/categories/1
  # PATCH/PUT /backend/categories/1.json
  def update
    respond_to do |format|
      if @backend_category.update(backend_category_params)
        format.html { redirect_to backend_categories_path, notice: 'Category was successfully updated.' }
        format.json { render :show, status: :ok, location: @backend_category }
      else
        format.html { render :edit }
        format.json { render json: @backend_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /backend/categories/1
  # DELETE /backend/categories/1.json
  def destroy
    @backend_category.destroy
    respond_to do |format|
      format.html { redirect_to backend_categories_url, notice: 'Category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def update_status
    @backend_category = Backend::Category.find(update_status_params[:category_id])
    @backend_category.status = !@backend_category.status
    @backend_category.update(status: @backend_category.status)
    # redirect_to backend_news_index_url
    respond_to do |format|
      format.json { render json:  {id: @backend_category.id, status: @backend_category.status }}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_backend_category
      @backend_category = Backend::Category.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def backend_category_params
      params.require(:backend_category).permit(:name, :status, :slug)
    end
  def update_status_params
      params.permit!
  end
end
