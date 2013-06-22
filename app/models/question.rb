class Question < ActiveRecord::Base
  attr_accessible :subject_id, :text, :subject, :possible_answers, :answers
  belongs_to :subject
  has_many :possible_answers
  has_many :answers, :through => :possible_answers
  has_one :teacher, :through => :subject

  validates_associated :subject
end
