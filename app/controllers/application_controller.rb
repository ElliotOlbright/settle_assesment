class ApplicationController < ActionController::API
  rescue_from NoMethodError, with: :bad_params


  def bad_params
    if request.query_parameters[:tag].nil?
      render json: { error: "Tags parameter is required" }, status: 400
    else
      render json: { error: "sortBy parameter is invalid" }, status: 400
    end
  end
end
