# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :subject do
    sequence(:title) {|n| "Subject #{n}"}
    description {Forgery(:lorem_ipsum).paragraphs 5}
    teacher
    before(:create) do |subject|
      t=subject.teacher
      if (subject.teacher.groups&&subject.groups).count==0 then
        g=t.groups.sample
        if g.nil? then
          g=FactoryGirl.create(:group_with_students)
          g.users << t
          g.save
        end
        subject.groups<<g
      end
    end
    factory :subject_with_questions do
      after(:create) do |subject|
        Array(5..20).sample.times {create(:question_with_answers, subject: subject)}
      end
    end
  end
end
