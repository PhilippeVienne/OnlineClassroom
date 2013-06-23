 class Users::RegistrationsController < Devise::RegistrationsController
  def new
    puts 'Hello it is me'
     super
  end

  # def create
  #   super
  # end
end
