class MeetingsController < ApplicationController

  def index
    @meetings = Meeting.order("date desc")
    respond_with @meetings
  end
end
