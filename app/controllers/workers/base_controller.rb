class Workers::BaseController < ApplicationController
  layout 'workers'
  before_filter :authenticate_worker!
end
