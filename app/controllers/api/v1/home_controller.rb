class Api::V1::HomeController < ActionController::API
  def home
    render status: 200, json: {message: "It's working!"}
  end
end
