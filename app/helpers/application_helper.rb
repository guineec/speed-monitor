module ApplicationHelper
  def dashboard(speed_tests)
    monthly_tests = speed_tests.where('created_at > ?', 1.month.ago)
    yearly_tests = speed_tests.where('created_at > ?', 1.year.ago)
    latest = speed_tests.where.not(download: nil).last.download
    monthly_average = monthly_tests.pluck(:download).compact.sum / monthly_tests.count
    yearly_average = yearly_tests.pluck(:download).compact.sum / yearly_tests.count
    {
      latest: latest,
      monthly_average: monthly_average,
      yearly_average: yearly_average
    }
  end

  def titleize(symbol)
    symbol.to_s.capitalize.gsub('_', ' ')
  end
end
