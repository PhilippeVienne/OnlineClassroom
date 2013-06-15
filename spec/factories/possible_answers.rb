# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :possible_answer do
    answer "MyText"
    correct false
    question_id 1
  end
end
