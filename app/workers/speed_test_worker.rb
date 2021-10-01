class SpeedTestWorker
  include Sidekiq::Worker

  COMMAND = 'speedtest-cli'.freeze

  def perform
    @speed_test = SpeedTest.create!(status: 'running')
    @output, @error, @status = Open3.capture3(COMMAND, '--json')

    return handle_success if @status.success?

    handle_failure
  rescue StandardError => e
    handle_failure
    raise e
  end

  private

  def handle_success
    Rails.logger.info('Ran speed test successfully.')
    Rails.logger.info("OUTPUT:    #{@output}")
    Rails.logger.info("EXIT CODE: #{@status.to_i}")

    @speed_test.update_with_json(@output)
  end

  def handle_failure
    Rails.logger.info('Speed test failed!')
    Rails.logger.info("OUTPUT:    #{@output}")
    Rails.logger.info("ERROR:     #{@error}")
    Rails.logger.info("EXIT CODE: #{@status.to_i}")

    @speed_test.update!(status: 'failed')
  end
end
