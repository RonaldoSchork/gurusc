class Admin::ProjectsController < Admin::AdminController

  def index
    @projects = Project.all
    respond_with @projects
  end

  def new
    @project = Project.new
    respond_with @project
  end

  def edit
    @project = Project.find(params[:id])
  end

  def create
    @project = Project.new(params[:project])
    @project.user_ids = [current_user.id]
    flash[:notice] = 'Projeto criado com sucesso.' if @project.save
    respond_with @project, :location => admin_projects_path
  end

  def update
    @project = Project.find(params[:id])
    flash[:notice] = 'Projeto atualizado com sucesso.' if @project.update_attributes(params[:project])
    respond_with @project, :location => edit_admin_project_path(@project)
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    respond_with @project, :location => admin_projects_path
  end
end
