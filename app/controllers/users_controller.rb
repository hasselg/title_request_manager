class UsersController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    @users = User.all
  end

  def create
    @user = User.new(new_user_params)

    if @user.save
      flash[:success] = "#{@user.email} created successfully."
      redirect_to action: "index"
    else
      render 'new'
    end
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    # If the user we are update is ourself, we need to be more restrictive
    if @user == current_user
      Rails.logger.debug("Updating the currently logged in user")
      update_result = @user.update_attributes(update_current_user_params)
      if update_result
        bypass_sign_in(@user)
      end
    else
      if params[:user][:password].blank?
        Rails.logger.debug("no password")
        update_result = @user.update_without_password(user_params)
      else
        Rails.logger.debug("password present")
        update_result = @user.update_attributes(user_params)
      end
    end

    if update_result
      flash[:success] = "User #{@user.email} updated successfully"
      redirect_to action: "index"
    else
      flash[:danger] = "User #{@user.email} not updated because of the follow error(s): #{@user.errors.full_messages}"
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])

    if @user == current_user
      flash[:danger] = "You can't remove yourself."
    else
      if @user.destroy
        flash[:success] = "User #{@user.email} was successfully removed."
      else
        flash[:danger] = "Unable to remove user #{@user.email}: #{@user.errors.full_messages}"
      end
    end

    redirect_to action: "index"
  end

  private
    def update_current_user_params
      params.require(:user).permit(:password, :password_confirmation)
    end

    def user_params
      params.require(:user).permit(:admin, :locked, :password, :password_confirmation)
    end

    def new_user_params
      params.require(:user).permit(:email, :admin, :locked, :password, :password_confirmation)
    end
end
