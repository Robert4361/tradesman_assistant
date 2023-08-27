class ServicesController < ApplicationController
  before_action :set_service, only: [:edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @services = current_user.services.all
  end

  def new
    @service = Service.new
  end

  def create
    @service = current_user.services.new(service_params)
    if @service.save
      respond_to do |format|
        format.html { redirect_to services_path, notice: "Service was successfully created." }
        format.turbo_stream
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @service.update(service_params)
      redirect_to services_path, notice: "Service was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @service.destroy
    redirect_to services_path, notice: "Service was successfully destroyed."
  end

  private

  def set_service
    @service = Service.find(params[:id])
  end

  def service_params
    params.require(:service).permit(:name, :price, :measurement_id)
  end
end
