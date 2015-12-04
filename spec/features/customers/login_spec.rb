feature 'Customer access' do

  background { login(create :customer) }

  scenario 'they can login' do
    expect(page).to have_content 'Find Workers by skills'
  end

  scenario 'they can logout' do
    click_link "Logout"
    expect(page).to have_content 'Welcome to Skillastic'
  end

end
