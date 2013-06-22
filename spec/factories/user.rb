
FactoryGirl.define do
  factory :user do
    email {Forgery(:internet).email_address}
    password 'totoismyfavouritejoke'
    password_confirmation 'totoismyfavouritejoke'
    #confirmed_at Date.today()
    #name 'Sample User'

    factory :teacher do
      after(:create) do |t|
        t.add_role :teacher
      end
    end
  end
end