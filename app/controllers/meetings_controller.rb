class MeetingsController < ApplicationController

  def index
    @meetings = Meeting.all
    respond_with @meetings
  end

  def show
    @meeting = Meeting.find(params[:id])
    respond_with @meeting
  end

end
