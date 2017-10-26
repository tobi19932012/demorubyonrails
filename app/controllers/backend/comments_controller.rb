class Backend::CommentsController < Backend::BaseController
  before_action :set_backend_comment, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token
  # GET /backend/comments
  # GET /backend/comments.json
  def index
    # @backend_comments = Backend::Comment.all
    @search = Backend::Comment.order(created_at: :desc).search(params[:q])
    @backend_comments = @search.result(:distinct => true)
    @backend_comments = @backend_comments.page(params[:page])
  end

  # GET /backend/comments/1
  # GET /backend/comments/1.json
  def show
  end

  # GET /backend/comments/new
  # def new
  #   @backend_comment = Backend::Comment.new
  # end

  # GET /backend/comments/1/edit
  # def edit
  # end

  # POST /backend/comments
  # POST /backend/comments.json
  # def create
  #   @backend_comment = Backend::Comment.new(backend_comment_params)
  #
  #   respond_to do |format|
  #     if @backend_comment.save
  #       format.html { redirect_to @backend_comment, notice: 'Comment was successfully created.' }
  #       format.json { render :show, status: :created, location: @backend_comment }
  #     else
  #       format.html { render :new }
  #       format.json { render json: @backend_comment.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # PATCH/PUT /backend/comments/1
  # PATCH/PUT /backend/comments/1.json
  def update
    respond_to do |format|
      if @backend_comment.update(backend_comment_params)
        format.html { redirect_to @backend_comment, notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @backend_comment }
      else
        format.html { render :edit }
        format.json { render json: @backend_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /backend/comments/1
  # DELETE /backend/comments/1.json
  def destroy
    @backend_comment.destroy
    respond_to do |format|
      format.html { redirect_to backend_comments_url, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  def update_status
    # byebug
    @backend_commnet = Backend::Comment.find(update_status_params[:comment_id])
    @backend_commnet.status = !@backend_commnet.status
    @backend_commnet.update(status: @backend_commnet.status)
    # redirect_to backend_news_index_url
    respond_to do |format|
      format.json { render json:  {id: @backend_commnet.id, status: @backend_commnet.status }}
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_backend_comment
      @backend_comment = Backend::Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def backend_comment_params
      params.fetch(:backend_comment, {})
    end

    def update_status_params
      params.permit( :title, :news_id, :user_id, :content, :status, :created_at, :updated_at, :comment_id)
    end
end
