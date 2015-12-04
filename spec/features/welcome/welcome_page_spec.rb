feature 'Welcome page' do

  scenario 'visit welcome page' do
    visit root_path
    expect(page).to have_content 'Welcome to Skillastic'
    expect(page).to have_content 'Worker login'
    expect(page).to have_content 'Customer login'
  end

end
