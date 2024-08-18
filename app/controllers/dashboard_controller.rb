class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    @forms = current_user.forms
  end
end
