class Workers::SkillsController < Workers::BaseController
  before_filter :set_skill, only: [:add, :remove]

  def add
    current_worker.skills<< @skill
    redirect_to :back, notice: "'#{@skill.name}' skill added"
  end

  def remove
    current_worker.skills.delete(@skill)
    redirect_to :back, notice: "'#{@skill.name}' skill removed"
  end

private
  def set_skill
    @skill = @skill || Skill.find(params['skill']['id'].to_i)
  end
end

