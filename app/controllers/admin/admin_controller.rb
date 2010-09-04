class Admin::AdminController < ApplicationController

  load_and_authorize_resource
  
  before_filter :authenticate_user!, :verify_admin

  layout 'admin'
  
private
  def verify_admin
    redirect_to root_path unless current_user.role == "admin"
  end
  
end
