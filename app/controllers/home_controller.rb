class HomeController < ApplicationController
	# before_filter :authenticate_user!
	
  def index
    @users = User.all
  end

  def faq
  end

  def rules
  end

  def blog
  end

  def error404
    
  end
end
