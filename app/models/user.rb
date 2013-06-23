class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :group_ids, :groups
  # attr_accessible :title, :body

  has_and_belongs_to_many :groups

  has_many :answers

  def subjects
    subjects=[]
    groups.each do |g|
      subjects << g.subjects
    end
    subjects
  end

  def self.students
    User.all - User.with_role(:teacher)
  end
end
