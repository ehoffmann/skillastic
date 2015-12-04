feature 'Customer home' do

  let(:customer) {create :customer}
  let!(:workers) {create_list(:worker_with_skills, 5)}

  background { login(customer) }

  scenario 'they can find skilled workers' do
    expect(page).to have_content 'Find Workers by skills'
    page.select workers[0].skills[0].name, :from => 'skill[id][]'
    page.select workers[0].skills[1].name, :from => 'skill[id][]'
    click_button "Search for skilled workers !"
    within('table#workersTable') do
      expect(page).to have_xpath(".//tr", :count => 2)
    end
    page.select workers[2].skills[0].name, :from => 'skill[id][]'
    click_button "Search for skilled workers !"
    expect(page).to have_content 'No results found'
  end

  scenario 'they can list workers by skill' do
    click_link workers[2].skills[0].name
    expect(page).to have_content "1 Workers having"
  end

end
