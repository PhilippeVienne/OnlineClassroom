
FactoryGirl.define do
  factory :group do
    sequence(:name) {|i| "Classroom #{i}"}
    factory :group_with_teacher do
      before(:create) do |group|
        teacher=User.with_role(:teacher).sample() || FactoryGirl.create( :teacher)
        group.users << teacher
      end
    end
    factory :group_with_students do
      before(:create) do |group|
        if User.students.count < 20 then
          (User.students.count .. 20).each do
            FactoryGirl.create(:user)
          end
        end
        User.students.sample(20).each do |u|
          group.users << u
        end
      end
    end
    factory :group_with_teacher_and_students do
      before(:create) do |group|
        if User.students.count < 20 then
          (User.students.count .. 20).each do
            FactoryGirl.create(:user)
          end
        end
        User.students.sample(20).each do |u|
          group.users << u
        end
        group.users << User.with_role(:teacher).sample() || FactoryGirl.create( :teacher)
      end
    end
  end
end