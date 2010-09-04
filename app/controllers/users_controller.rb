class UsersController < ApplicationController

  load_and_authorize_resource

  def index
    @users = User.all
    respond_with @users
  end

  def new
    @user = User.new
    respond_with @user
  end

  def create
    @user = User.new(params[:user])
    flash[:notice] = 'Usuário criado com sucesso.' if @user.save
    respond_with @user, :location => users_path
  end
  
  def show
    @user = User.find(params[:id])
    respond_with @user
  end

end
