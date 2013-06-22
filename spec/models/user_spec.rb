require 'spec_helper'

describe User do

  describe 'abilities' do
    subject { ability }
    let(:ability) { Ability.new(user) }
    let(:user) {nil}

    context 'When is a guest' do
      it{ should_not be_able_to(:join,Group) }
    end

    context 'When is a student' do
      let(:user) {FactoryGirl.create(:user)}
      it{ should be_able_to(:join, Group)}
      it{ should_not be_able_to(:create, Group)}
      it 'should be able to answer to a group subject' do
        subject=FactoryGirl.create(:subject)
        Ability.new(subject.groups.sample.students.sample).should be_able_to(:answer,subject)
      end
    end

  end
  before do
    @user = FactoryGirl.create :user
  end
  subject{@user}

  it { should be_valid }

end
