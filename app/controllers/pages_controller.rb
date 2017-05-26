class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]
  layout 'home'
  def home
  end
end
