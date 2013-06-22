class PossibleAnswer < ActiveRecord::Base
  attr_accessible :answer, :correct, :question_id

  belongs_to :question
  has_one :subject, :through => :question
  has_one :teacher, :through => :subject

  has_many :answers

  validates :question, :presence => true
end
