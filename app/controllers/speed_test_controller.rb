class SpeedTestController < ApplicationController
  def dashboard
    @speed_tests = SpeedTest.where('created_at > ?', 1.year.ago)
  end

  def index
    paginate batch_size: 15
    @speed_tests = SpeedTest.all.limit(@limit).offset(@offset)
  end
end
