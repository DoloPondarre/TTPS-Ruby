class UsersController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  # GET /users or /users.json
  def index
    @users = User.all
  end

  # GET /users/1 or /users/1.json
  def show
    
  end

  # GET /users/new
  def new
    @user = User.new(user_params)
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users or /users.json
  def create
    @user = User.create(user_params)
    
    respond_to do |format|
      if @user.save
        format.html { redirect_to user_url(@user), notice: "User was successfully created." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    if user_params[:password].blank?
      user_params.delete(:password)
      user_params.delete(:password_confirmation)
    end
  
    successfully_updated = if needs_password?(@user, user_params)
                             @user.update(user_params)
                           else
                             @user.update_without_password(user_params)
                           end
  
    if successfully_updated
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    unless (@user.staff? and Shift.find_by(staff_id: @user.id).nil?)
      respond_to do |format|
        format.html { redirect_to user_url(@user), notice:  "Este usuario no puede ser eliminado, tiene turnos atendidos asociados."}
      end
    else
      @user.destroy

      respond_to do |format|
        format.html { redirect_to users_url, notice: "User was successfully destroyed." }
        format.json { head :no_content }
      end
    end
  end

  private
    def needs_password?(_user, params)
      params[:password].present?
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.fetch(:user, {}).permit(
        :email,
        :password,
        :password_confirmation,
        :name,
        :role_id,
        :branch_id
      )
    end
end
