class BillsController < ApplicationController
  before_action :set_bill, only: [:show, :destroy]

  def index
    @bills = current_user.bills.all
  end

  def show
  end

  def new
    @bill = Bill.new
  end

  def create
    @bill = current_user.bills.new(bill_params)
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
    params.require(:bill).permit(:date, :discount, bill_items_attributes: [:quantity, :service_id ])
  end
end
