class Group < ActiveRecord::Base
  attr_accessible :name, :users, :subjects

  has_and_belongs_to_many :subjects

  has_and_belongs_to_many :users

  def teachers
    User.with_role(:teacher) & users
  end

  def students
    users - teachers
  end
end
