class GuestsController < ApplicationController
  skip_before_action :authenticate_user!
  def index
    @pagy, @users = pagy(User.where(admin: false), items: 3)
  end
end
