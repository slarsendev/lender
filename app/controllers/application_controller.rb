class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :handle_record_not_found

  private

  def handle_record_not_found
    render plain: "Record Not Found!", status: :not_found
  end
end
