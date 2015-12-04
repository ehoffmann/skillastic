class WorkerDecorator < Draper::Decorator
  delegate_all

  def display_skills_tags(selected_ids)
    model.skills.map do |skill|
      css_class = "ui label"
      css_class << " olive" if selected_ids.include?(skill.id.to_i)
      h.link_to skill, h.customers_skill_path(skill.id), class: css_class
    end.join(" ").html_safe
  end
end
