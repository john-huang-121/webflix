class ApplicationController < ActionController::Base
  before_action :protect_from_forgery
end
