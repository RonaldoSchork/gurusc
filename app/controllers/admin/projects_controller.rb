class Admin::ProjectsController < Admin::AdminController

  def index
    @projects = Project.all
    respond_with @projects
  end

  def show
    @project = Project.find(params[:id])
    respond_with @project
  end

  def new
    @project = Project.new
    respond_with @project
  end

  def edit
    @project = Project.find(params[:id])
  end

  def create
    @project = current_user.projects.build(params[:project])
    flash[:notice] = 'project was successfully created.' if @project.save
    respond_with @project, :location => admin_projects_path
  end

  def update
    @project = Project.find(params[:id])
    flash[:notice] = 'Project was successfully updated.' if @project.update_attributes(params[:project])
    respond_with @project, :location => edit_admin_project_path(@project)
  end

  # DELETE /projects/1
  # DELETE /projects/1.xml
  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    respond_with @project, :location => admin_projects_path
  end
end
