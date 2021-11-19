# frozen_string_literal: true

class Accounts::SessionsController < Devise::SessionsController
  respond_to :json
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   # debugger
  #   # account = Account.new(params[:registration])
  #   # if account.save!
  #   #   render json: {status: "GREAT"}
  #   # else
  #   #   render json: {status: "TERRIBLE"}
  #   # end
  # end


  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  private

  def respond_with(resource, _opts = {})
    render json: resource
  end

  def respond_to_on_destroy
    head :no_content
  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
