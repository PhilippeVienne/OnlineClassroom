# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :possible_answer do
    sequence(:answer) {|n| "Answer #{n}"}
    correct false
  end
end
