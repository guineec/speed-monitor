class ApplicationController < ActionController::Base
  def paginate(batch_size: 10)
    @limit = (params[:l] || batch_size).to_i
    @offset = (params[:o] || 0).to_i
    @max_records = self.class.to_s.gsub('Controller', '').constantize.count
  end
end
