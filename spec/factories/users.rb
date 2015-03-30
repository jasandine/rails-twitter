FactoryGirl.define do
  factory :user do
    username('oldirtytester')
    email('odt@wu.com')
    password('11111111')
    password_confirmation('11111111')
  end
end
