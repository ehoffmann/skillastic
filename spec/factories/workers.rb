FactoryGirl.define do

  factory :worker do
    first_name "John"
    last_name "Doe"
    sequence(:email) { |n| "#{n}@test.com" }
    password "12345678"
    password_confirmation {|u| u.password }

    factory :worker_with_skills do
      transient do
        skills_count 5
      end

      after(:create) do |worker, evaluator|
        create_list(:skill, evaluator.skills_count, workers: [worker])
      end
    end
  end

end
