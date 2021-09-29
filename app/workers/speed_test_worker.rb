class SpeedTestWorker
  include Sidekiq::Worker

  def perform(*args)
    puts "This will be where the speed tests happen"
  end
end
