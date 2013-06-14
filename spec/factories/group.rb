
FactoryGirl.define do
  factory :group do
    sequence(:name) {|i| "Classroom #{i}"}
    factory :group_with_teacher do
      after(:create) do |group|
        teacher=User.with_role(:teacher).sample() || FactoryGirl.create( :teacher)
        group.users << teacher
        group.save
      end
    end
    factory :group_with_teacher_and_students do
      after(:create) do |group|
        students = User.all - User.with_role(:teacher)
        if students.count < 20 then
          (students.count .. 20).each do
            students.push FactoryGirl.create(:user)
          end
        end
        students = students.sample(20)
        teacher=User.with_role(:teacher).sample() || FactoryGirl.create( :teacher)
        group.users << teacher
        students.each { |s| group.users << s }
        group.save
      end
    end
  end
end