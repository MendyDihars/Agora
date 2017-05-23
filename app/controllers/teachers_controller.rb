class TeachersController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]

  def index
    @teachers = User.all

    if search_params[:user_skill].present?
      @teachers = User.joins(:user_skills).where(user_skills:
        { skill_id: Skill.find_by("name =  ?", search_params[:user_skill].capitalize) }
      )
    end

    if search_params[:address].present?
      @teachers = @teachers.near(search_params[:address])
    end

    @teachers = @teachers.where.not(latitude: nil, longitude: nil)
  end

  def show
    @teachers = User.find(params[:id])
  end

  def search_params
    params.require(:index).permit(:user_skill, :address)
  end

end
