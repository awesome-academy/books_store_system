class AdminController < ApplicationController
  before_action :user_login?, :is_admin?

  def index; end
end
