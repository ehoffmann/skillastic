describe WorkerBySkillQuery do

  let(:worker) { create(:worker_with_skills) }

  it "has skills" do
    expect(worker.skills.count).to be 5
  end

  it "#with_skill matches one skill" do
    skill1 = worker.skills[0]
    expect(WorkerBySkillQuery.new(skill1.id).search.count).to be 1
  end

  it "#with_skill matches two skill" do
    skill1, skill2 = worker.skills[0], worker.skills[1]
    expect(WorkerBySkillQuery
           .new([skill1.id, skill2.id])
           .search
           .first
          ).to match worker
  end

  it "#with_skill fails to match skill" do
    skill =  create(:skill)
    expect(WorkerBySkillQuery.new(skill.id).search.count).to be 0
  end
end
