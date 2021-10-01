class SpeedTestController < ApplicationController
  def dashboard
    @speed_tests = SpeedTest.where('created_at > ?', 1.year.ago).order(:created_at => :desc)
  end

  def index
    paginate
    @speed_tests = SpeedTest.all.limit(@limit).offset(@offset).order(:created_at => :desc)
  end
end
