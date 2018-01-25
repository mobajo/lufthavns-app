class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :afgange_scrape]

  def home
  end

end
