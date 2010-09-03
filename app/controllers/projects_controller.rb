class ProjectsController < ApplicationController

  def index
    @projects = Project.all
    respond_with @projects
  end

  def show
    @project = Project.find(params[:id])
    respond_with @project
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
