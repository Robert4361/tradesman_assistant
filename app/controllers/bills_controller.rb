class BillsController < ApplicationController
  def index
    @bills = current_user.bills.all
  end
end
