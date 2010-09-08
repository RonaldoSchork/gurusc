class ProjectsController < ApplicationController

  load_and_authorize_resource

  def index
    @projects = Project.all
    respond_with @projects
  end

  def show
    @project = Project.find(params[:id])
    respond_with @project
  end

  def edit
    @project = Project.find(params[:id])
  end

  def create
    @project = Project.new(params[:project])
    @project.user_ids = [current_user.id]
    flash[:notice] = 'Projeto criado com sucesso.' if @project.save
    respond_with @project, :location => projects_path
  end

  def update
    @project = Project.find(params[:id])
    flash[:notice] = 'Projeto atualizado com sucesso.' if @project.update_attributes(params[:project])
    respond_with @project, :location => edit_project_path(@project)
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    respond_with @project, :location => projects_path
  end
    
  def member_add
    @project = Project.find(params[:id])
    @project.user_ids += [current_user.id]
    flash[:notice] = 'Adicionado ao seus projetos com sucesso.' if @project.save
    redirect_to projects_path
  end
  
  def member_remove
    @project = Project.find(params[:id])
    @project.user_ids -= [current_user.id]
    flash[:notice] = 'Removido dos seus projetos com sucesso.' if @project.save
    redirect_to projects_path
  end

end
