class Customers::BaseController < ApplicationController
  layout 'customers'
  before_action :authenticate_customer!
end
