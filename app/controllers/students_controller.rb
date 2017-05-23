class StudentsController < ApplicationController

  def index
    @user_skills = current_user.own_skills
    @requested_skills = []
    @students = []
    @user_skills.each do |skill|
      @requested_skills << RequestedSkill.where(skill_id: skill.id)
    end
    @requested_skills.flatten!
    @requested_skills.each do |r|
      @students << User.where(id: r.user_id)
    end
    @students.flatten!
  end

end
