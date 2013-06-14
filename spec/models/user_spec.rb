require 'spec_helper'

describe User do
  before do
    @user = FactoryGirl.create :user
  end
  subject{@user}

  it { should be_valid }

end
