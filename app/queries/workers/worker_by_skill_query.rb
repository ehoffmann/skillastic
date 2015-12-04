class WorkerBySkillQuery

  def initialize(skill_ids, relation = Worker.all)
    @skill_ids = Array(skill_ids).uniq.map(&:to_i).reject{|id| id == 0}
    @relation  = relation
  end

  def search
    return @relation unless @skill_ids.any?
    result
  end

  private

  def result
    @relation.where(sql)
  end

  def sql
    query.to_sql
  end

  def query
    workers[:id].in(matching_result_set)
  end

  def matching_result_set
    workers
      .project(workers[:id])
      .join(abilities, Arel::Nodes::OuterJoin)
      .on(workers[:id].eq abilities[:worker_id])
      .join(skills, Arel::Nodes::OuterJoin)
      .on(skills[:id].eq abilities[:skill_id])
      .where(skills[:id].in(@skill_ids))
      .group(workers[:id])
      .having(Arel.star.count.eq @skill_ids.size)
  end

  def workers
    @workers ||= Worker.arel_table
  end

  def skills
    @skills ||= Skill.arel_table
  end

  def abilities
    @abilities ||= Ability.arel_table
  end
end
