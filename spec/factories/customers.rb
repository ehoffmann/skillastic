FactoryGirl.define do

  factory :customer do
    first_name "John"
    last_name "Doe"
    email { "#{first_name}.#{last_name}@test.com".downcase }
    password "12345678"
  end

end
