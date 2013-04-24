class HomeController < ApplicationController
	# before_filter :authenticate_user!
	
  def index
    @users = User.all
  end

  def faq
  end

  def rules
  end
end
