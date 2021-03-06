class ProjectsController < ApplicationController
  load_and_authorize_resource
  before_filter :load_user, :only => [:member_remove, :member_add]
  after_filter  :user_save, :only => [:member_remove, :member_add]

  def index
    @projects = Project.all
    respond_with @projects
  end

  def show
    respond_with @project
  end

  def edit
  end

  def create
    @project.user_ids = [current_user.id]
    flash[:notice] = 'Projeto criado com sucesso.' if @project.save
    respond_with @project, :location => projects_path
  end

  def update
    flash[:notice] = 'Projeto atualizado com sucesso.' if @project.update_attributes(params[:project])
    respond_with @project, :location => edit_project_path(@project)
  end

  def destroy
    @project.destroy
    respond_with @project, :location => projects_path
  end

  def member_add
    @project.user_ids += [current_user.id]
    @user.number_of_projects += 1
    flash[:notice] = 'Adicionado ao seus projetos com sucesso.' if @project.save
    redirect_to projects_path
  end

  def member_remove
    @project.user_ids -= [current_user.id]
    @user.number_of_projects -= 1
    flash[:notice] = 'Removido dos seus projetos com sucesso.' if @project.save
    redirect_to projects_path
  end

protected

  def load_user
    @user = current_user
  end

  def user_save
    @user.save!
  end
end
