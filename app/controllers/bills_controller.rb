class BillsController < ApplicationController
  before_action :set_bill, only: [:show, :destroy]

  def index
    @bills = current_user.bills.all
  end

  def show
  end

  def new
    @bill = current_user.bills.new
  end

  def create
    @bill = current_user.bills.build(bill_params)
    binding.pry
    if @bill.save
      respond_to do |format|
        render @bill
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @bill.destroy
    redirect_to bills_path, notice: "Bill was successfully destroyed."
  end

  private

  def set_bill
    @bill = Bill.find(params[:id])
  end

  def bill_params
    params.require(:bill).permit(:discount, :client_id, bill_items_attributes: [:id, :quantity, :service_id, :_destroy])
  end
end
