feature 'Worker home' do

  let(:worker) { create :worker_with_skills }
  let!(:last_skill) { create :skill, name: "the last skill" }
  background { login(worker) }

  scenario 'they can remove a skill' do
    expect(worker.skills.count).to be 5
    expect(page).to have_content 'Your skills'
    first('.edit_skill').click_button "Remove"
    expect(worker.skills.count).to be 4
  end

  scenario 'they can add a skill' do
    expect(worker.skills.count).to be 5
    first('.add_skill').click_button "Add"
    expect(worker.skills.count).to be 6
  end
end
