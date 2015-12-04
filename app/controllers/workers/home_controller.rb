class Workers::HomeController < Workers::BaseController
  def index
    @worker = current_worker
  end
end
