class PossibleAnswer < ActiveRecord::Base
  attr_accessible :answer, :correct, :question_id

  belongs_to :question

  has_many :answers
end
