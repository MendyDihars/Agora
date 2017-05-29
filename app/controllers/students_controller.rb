class StudentsController < ApplicationController

  def index
    @user_skills = current_user.own_skills
    @requested_skills = @user_skills.map do |skill|
      RequestedSkill.where(skill_id: skill.id)
    end
    @requested_skills.flatten!
    @students = @requested_skills.map { |r| User.where(id: r.user_id) }.flatten
    @students

  end

end
