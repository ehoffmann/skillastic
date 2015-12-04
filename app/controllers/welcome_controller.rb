class WelcomeController < ApplicationController
  def index
    if worker_signed_in?
      redirect_to workers_home_path
    elsif customer_signed_in?
      redirect_to customers_home_path
    end
  end
end
