class Customers::HomeController < Customers::BaseController
  before_filter :load_objects

  def workers
    if @selected_skills.any?
      @workers = WorkerBySkillQuery.new(@selected_skills).search
    else
      @workers = Worker.all
    end
    @workers = @workers.includes(:skills).paginate(paginate_params).decorate
  end

  def skill
    @skill = Skill.find(params[:id].to_i)
    @workers = @skill.workers.includes(:skills)
    @workers = @workers.paginate(paginate_params).decorate
  end

  private
  def paginate_params
    {:page => params[:page], :per_page => 30}
  end

  def load_objects
    @selected_skills = params.fetch(:skill, {})[:id] || {}
    @skills = Skill.all
  end
end
