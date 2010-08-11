class Admin::UploadsController < Admin::AdminController

  def index
    @uploads = Upload.all
    respond_with @uploads
  end

  def show
    @upload = Upload.find(params[:id])
    respond_with @uploads
  end

  def new
    @upload = Upload.new
    respond_with @uploads
  end

  def edit
    @upload = Upload.find(params[:id])
  end

  def create
    @upload = Upload.new(params[:upload])
    flash[:notice] = 'Upload feito com sucesso.' if @upload.save
    respond_with @upload, :location => [:admin, @upload]
  end
  
  def update
    @upload = Upload.find(params[:id])
    flash[:notice] = 'Upload atualizado com sucesso.' if @upload.update_attributes(params[:upload])
    respond_with @upload, :location => [:admin, @upload]
  end

  def destroy
    @upload = Upload.find(params[:id])
    @upload.destroy
    respond_with @upload, :location => admin_uploads_path
  end
end
