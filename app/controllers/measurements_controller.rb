class MeasurementsController < ApplicationController
  before_action :set_measurement, only: [:edit, :update, :destroy]

  def index
    @measurements = current_user.measurements.all
  end

  def new
    @measurement = Measurement.new
  end

  def create
    @measurement = current_user.measurements.new(measurement_params)
    if @measurement.save
      respond_to do |format|
        format.html { redirect_to measurements_path, notice: "Measurement was successfully created." }
        format.turbo_stream
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @measurement.update(measurement_params)
      redirect_to measurements_path, notice: "Measurement was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @measurement.destroy
    redirect_to measurements_path, notice: "Measurement was successfully destroyed."
  end

  private

  def set_measurement
    @measurement = Measurement.find(params[:id])
  end

  def measurement_params
    params.require(:measurement).permit(:name)
  end
end
