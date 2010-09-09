class MeetingsController < ApplicationController

  def index
    @meetings = Meeting.all
    respond_with @meetings
  end

end
