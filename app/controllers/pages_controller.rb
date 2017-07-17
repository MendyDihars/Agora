class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]
  layout 'home'

  def home
    pre_addresses = User.all.map do |user|
      user.address
    end
    @addresses = pre_addresses.uniq
  end
end
