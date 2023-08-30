class StatisticsController < ApplicationController
  def index
    @bills = current_user.bills
    @bills_per_client = {}
    current_user.clients.each do |client|
      @bills_per_client.store("#{client.first_name + " " + client.last_name}", client.bills.count)
    end
    @bills_per_year = @bills.group_by { |b| b.date.year }.transform_values { |value| [value.count, value.map(&:price).sum] }
  end
end
