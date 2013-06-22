# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :answer do
    after(:build) do |answer|
      possible_answer = answer.possible_answer
      raise 'None linked possible answer' if possible_answer.nil?
      if answer.user.nil? then
        raise 'None linked possible answer' if possible_answer.nil?
        raise 'None subject in linked possible answer' if possible_answer.subject.nil?
        raise 'None group in linked possible answer' if possible_answer.subject.groups.nil?
        raise 'None group in linked possible answer' if possible_answer.subject.groups.empty?
        raise 'None student in linked group' if possible_answer.subject.groups.sample.students.empty?
        answer.user = possible_answer.subject.groups.sample.students.sample
      end
    end
  end
end
