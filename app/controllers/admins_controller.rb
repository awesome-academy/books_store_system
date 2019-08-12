class AdminsController < ApplicationController
  before_action :is_admin?

  def is_admin?
    return user_login?
    return if current_user.admin?
  end
end
