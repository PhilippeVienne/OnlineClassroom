class Group < ActiveRecord::Base
  attr_accessible :name, :users

  has_and_belongs_to_many :users
end
