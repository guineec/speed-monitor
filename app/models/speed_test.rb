class SpeedTest < ApplicationRecord
  ALLOWED_STATUSES = %w[running finished failed]

  validates :status, inclusion: { in: ALLOWED_STATUSES }

  def update_with_json(json_string)
    json = JSON.parse(json_string)
    download = (json['download'] / 1_000_000.0).round
    upload = (json['upload'] / 1_000_000.0).round
    ping = json['ping'].round

    success = update(status: 'finished', ping: ping, download: download, upload: upload)
    update!(status: 'failed') unless success
  end
end
