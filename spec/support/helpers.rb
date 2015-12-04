module FeatureHelper

  def login(user)
   klass =  user.class.name.downcase
   visit send("new_#{klass}_session_path")
   fill_in "#{klass}_email", with: user.email
   fill_in "#{klass}_password", with: user.password
   click_button 'Log in'
  end

  def page!
    save_and_open_page
  end
end


RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
  config.include FeatureHelper, type: :feature
end
