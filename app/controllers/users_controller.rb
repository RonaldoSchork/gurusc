class UsersController < ApplicationController
  load_and_authorize_resource

  def index
    @users = User.all
    respond_with @users
  end

  def edit
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
    respond_with @user
  end

  def create
    @user = User.new(params[:user])
    flash[:notice] = 'Cadastro realizado com sucesso.' if @user.save
    respond_with @user, :location => login_path
  end

  def update
    @user = User.find(params[:id])
    flash[:notice] = 'Usuário atualizado.' if @user.update_attributes(params[:user])
    respond_with @user, :location => user_path
  end

  def show
    @user = User.find(params[:id])
    respond_with @user
  end
end
