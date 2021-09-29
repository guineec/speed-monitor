class ApplicationController < ActionController::Base
  def paginate(batch_size: 10)
    @limit = params[:l] || batch_size
    @offset = params[:o] || 0
  end
end
