class Admin::MeetingsController < Admin::AdminController

  def index
    @meetings = Meeting.all
    respond_with @meetings
  end

  def show
    @meeting = Meeting.find(params[:id])
    respond_with @meeting
  end

  def new
    @meeting = Meeting.new
    respond_with @meeting
  end

  def edit
    @meeting = Meeting.find(params[:id])
  end

  def create
    @meeting = Meeting.create(params[:meeting])
    flash[:notice] = 'Encontro criado com sucesso.' if @meeting.save
    respond_with @meeting, :location => admin_meetings_path

  end

  def update
    @meeting = Meeting.find(params[:id])
    flash[:notice] = 'Encontro atualizado com sucesso.' if @meeting.update_attributes(params[:meeting])
    respond_with @meeting, :location => edit_admin_meeting_path(@meeting)
  end

  def destroy
    @meeting = Meeting.find(params[:id])
    @meeting.destroy
    respond_with @meeting, :location => admin_meetings_path
  end
  
end
