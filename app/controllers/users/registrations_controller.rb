class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters

  def new
    super
  end

  def create
    super
    create_userskill
  end

  private

  def create_userskill
    userskill = UserSkill.new(skill_id: user_skills_params[:user_skill_ids][1])
    if current_user != nil
      userskill.user_id = current_user.id
      userskill.save
    end
  end

  def user_skills_params
    params.require(:user).permit(user_skill_ids: [])
  end

end
