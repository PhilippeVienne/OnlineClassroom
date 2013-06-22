# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :question do
    text {Forgery(:lorem_ipsum).words( Array(5..10).sample)+'?'}
    subject
    factory :question_with_answers do
      after(:create) do |question|
        Array(3..4).sample.times { FactoryGirl.create(:possible_answer, question: question, correct: false) }
        pa=question.possible_answers.sample
        pa.correct=true
        pa.save
        question.subject.groups.each do |group|
          group.students.each do |student|
            FactoryGirl.create(:answer, :user=>student, :possible_answer=>question.possible_answers.sample)
          end
        end
      end
    end
  end
end
