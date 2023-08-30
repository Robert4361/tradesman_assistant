class BillsController < ApplicationController
  before_action :set_bill, only: [:show, :destroy, :set_as_paid]

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
    if @bill.save
      redirect_to @bill
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @bill.destroy
    redirect_to bills_path, notice: "Bill was successfully destroyed."
  end

  def set_as_paid
    if @bill.update(paid: true)
      respond_to do |format|
        format.html { render @bill, notice: "Bill set as paid" }
        format.turbo_stream { render turbo_stream: turbo_stream.update("paid",
                                                                       "<p> Payment status: paid </p>") }
      end
    end
  end

  private

  def set_bill
    @bill = Bill.find(params[:id])
  end

  def bill_params
    params.require(:bill).permit(:discount, :client_id, bill_items_attributes: [:id, :quantity, :service_id, :_destroy])
  end
end
