class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters

  def new
    super
  end

  def create
    super
    create_userskill
  end

  def update
    super
    if user_params[:user_skills] == Skill.find(user_params[:user_skills])
        user_skills = UserSkill.find(current_user.user_skills.ids.first)
        user_skills.skill_id = user_params[:user_skills]
        user_skills.save
    end
  end

  private

  def create_userskill
    userskill = UserSkill.new(skill_id: user_params[:user_skills].to_i)
    if current_user != nil
      userskill.user_id = current_user.id
      userskill.save
    end
  end

  def user_skills_params
    params.require(:user).permit(user_skill_ids: [])
  end

  def user_params
    params.require(:user).permit(:user_skills)
  end

end
