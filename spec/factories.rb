FactoryGirl.define do
  sequence :email do |n|
    "test_#{n}@test.com"
  end

  factory :user do
    username 'Tester'
    email
    first_name 'Test'
    last_name 'Tester'
    password_digest 'password'
  end
end
