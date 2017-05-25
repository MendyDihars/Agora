class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters

  def new

    super

  end

  def create
    # insert special code into instance and ensure that code is unique in database
    super # continue to devise registration to CREATE user

  end

  private


end
