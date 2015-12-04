feature 'Woker access' do

  background { login(create :worker) }

  scenario 'they can login' do
    expect(page).to have_content 'Your skills'
  end

  scenario 'they can logout' do
    click_link "Logout"
    expect(page).to have_content 'Welcome to Skillastic'
  end

end
