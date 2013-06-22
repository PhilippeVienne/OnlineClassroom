class Subject < ActiveRecord::Base
  attr_accessible :description, :teacher_id, :title, :questions, :answers

  belongs_to :teacher, :class_name => 'User'
  validates_associated :teacher

  has_many :questions
  has_many :answers, :through => :questions

  has_and_belongs_to_many :groups
  validates_associated :groups
end
