class Ability
  include CanCan::Ability

  def initialize(user)

    # See the wiki for help on this file:
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities

    guest=user.nil?

    # If user does not logged, create an guest user
    user||=User.new

    subject_group=[Subject, Answer, PossibleAnswer, Question]
    all_resources=subject_group + [Group]

    unless guest then

      cannot :manage, all_resources

      # Permissions for all users
      can [:join,:index, :leave,:update_user_associations], Group # All users can join a group
      can :view, Group do |g| # All users can view their group
        g.users.include? user
      end

      if user.has_role? :teacher
        can :create, all_resources # A teacher can create all resources on the website
        can :manage, subject_group, :teacher => user # Teacher can manage its own subjects
        can :manage, Group do |g| # Teacher can manage its groups
          g.teachers.include? user
        end
        cannot :destroy, Group do |g| # Teacher can not destroy its group
          g.teachers.count > 1 # if their is another teacher
        end
      else #Then the user is a student
        can :answer, Subject do |s|
          !(s.groups & user.groups).empty?
        end
      end
    end
    end
  end
