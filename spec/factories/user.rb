
FactoryGirl.define do
  factory :user do
    email "my-user@exemple.com"
    password 'totoismyfavouritejoke'
    password_confirmation 'totoismyfavouritejoke'
    #confirmed_at Date.today()
    #name 'Sample User'
  end
end