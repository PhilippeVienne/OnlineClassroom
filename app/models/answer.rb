class Answer < ActiveRecord::Base
  attr_accessible :possible_answer_id, :user_id, :user, :question, :subject
  belongs_to :user
  belongs_to :possible_answer
  has_one :question, :through => :possible_answer
  has_one :subject, :through => :question
end
