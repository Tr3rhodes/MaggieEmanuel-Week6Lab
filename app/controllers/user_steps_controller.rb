class UserStepsController < ApplicationController
  include Wicked::Wizard
  before_filter :authenticate_user!

  steps :username, :user_photo, :user_bio

  def show
    @user = current_user
    render_wizard
  end

  def update
    @user = current_user
    @user.update_attributes(user_params)
    render_wizard @user
  end

  def finish_wizard_path
    user_path(current_user)

  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :username, :user_bio, :user_photo, :first_name, :last_name)

  end

end
