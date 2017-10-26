class Backend::UsersController < Backend::BaseController
  before_action :set_backend_user, only: [:show, :edit, :update, :destroy]

  # GET /backend/users
  # GET /backend/users.json
  def index
    # @backend_users = User.all
    @search = User.order(created_at: :desc).search(params[:q])
    @backend_users = @search.result(:distinct => true)
    @backend_users = @backend_users.page(params[:page])
  end

  # GET /backend/users/1
  # GET /backend/users/1.json
  def show
  end

  # GET /backend/users/new
  def new
    @backend_user = User.new
  end

  # GET /backend/users/1/edit
  def edit
  end

  # POST /backend/users
  # POST /backend/users.json
  def create
    @backend_user = User.new(create_user_params)

    respond_to do |format|
      if @backend_user.save
        format.html { redirect_to backend_users_path, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @backend_user }
      else
        format.html { render :new }
        format.json { render json: @backend_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /backend/users/1
  # PATCH/PUT /backend/users/1.json
  def update
    respond_to do |format|
      if @backend_user.update(update_user_params)
        format.html { redirect_to backend_users_url, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @backend_user }
      else
        format.html { render :edit }
        format.json { render json: @backend_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /backend/users/1
  # DELETE /backend/users/1.json
  def destroy
    @backend_user.destroy
    respond_to do |format|
      format.html { redirect_to backend_users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_backend_user
      @backend_user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def backend_user_params
      params.permit!
    end
  def create_user_params
    params.require(:user).permit(
        :user_name,:full_name, :email, :password, :password_confirmation
    )
  end

  def update_user_params
    params.require(:user).permit(
        :user_name,:full_name, :email, :avatar
    )
  end
end
