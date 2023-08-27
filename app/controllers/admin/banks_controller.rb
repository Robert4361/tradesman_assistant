class Admin::BanksController < ApplicationController
  before_action :set_bank, only: [:edit, :update, :destroy]
  before_action :check_if_admin?

  def index
    @banks = Bank.all
  end

  def new
    @bank = Bank.new
  end

  def create
    @bank = Bank.new(bank_params)
    if @bank.save
      respond_to do |format|
        format.html { redirect_to admin_banks_path, notice: "Bank was successfully created." }
        format.turbo_stream
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @bank.update(bank_params)
      redirect_to admin_banks_path, notice: "Bank was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @bank.destroy
    redirect_to admin_banks_path, notice: "Bank was successfully destroyed."
  end

  private

  def set_bank
    @bank = Bank.find(params[:id])
  end

  def check_if_admin?
    redirect_to root_path unless current_user.admin?
  end

  def bank_params
    params.require(:bank).permit(:name, :pid)
  end
end
