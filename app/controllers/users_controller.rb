class UsersController < ApplicationController
  load_and_authorize_resource

  def index
    @users = User.all
    respond_with @users
  end

  def edit
  end

  def new
    @user = User.new
    respond_with @user
  end

  def create
    flash[:notice] = 'Cadastro realizado com sucesso.' if @user.save
    respond_with @user, :location => login_path
  end

  def update
    flash[:notice] = 'Usuário atualizado.' if @user.update_attributes(params[:user])
    respond_with @user, :location => user_path
  end

  def show
    respond_with @user
  end
end
