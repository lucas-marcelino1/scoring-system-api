class RegistrationsController < Devise::RegistrationsController
  respond_to :json

  def create
    build_resource(sign_up_params)
    if resource.save
      render status: :created, json: {message: 'User created successfully', user: resource.name, email: resource.email}
    else
      render status: :unprocessable_entity, json: {message: 'Its failed', errors: "#{resource.errors.full_messages}"} 
    end
  end

  def sign_up_params
    params.require(:user).permit(:email, :password, :name, :phone, :city, :address)
  end
end