class Admin::UsersController < ApplicationController
  before_action :set_user, only: [:show, :activate]
  before_action :check_if_admin?

  def index
    if params[:activated] == "false"
      @users = User.where(activated: false)
    else
      @users = User.all
    end
  end

  def show
  end

  def activate
    if @user.update(activated: true)
      AdminMailer.with(user: @user).welcome_email.deliver_now!
      respond_to do |format|
        format.html { render @user, notice: "User successfully activated" }
        format.turbo_stream { render turbo_stream: turbo_stream.update("activated",
                                                                       "<p> Activation status: true </p>") }
      end
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def check_if_admin?
    redirect_to root_path unless current_user.admin?
  end
end
