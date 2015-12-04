require 'capybara/poltergeist'

Capybara.javascript_driver = :poltergeist
Capybara.default_max_wait_time = 5
Capybara.asset_host = 'http://localhost:3000'

