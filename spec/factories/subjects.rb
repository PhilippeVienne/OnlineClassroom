# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :subject do
    title "MyString"
    description "MyText"
    teacher_id 1
  end
end
