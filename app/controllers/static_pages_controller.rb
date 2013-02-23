class StaticPagesController < ApplicationController
  skip_before_filter :authenticate_user!
  def home
  end

  def about
  end

  def privacy
  end

  def contact
  end
end
