class Api::UsersController < ApplicationController

  before_filter :check_auth


  def check_auth
    authenticate_or_request_with_http_basic do |email,password|
      user = User.where(email: email).first
      !user.nil? && user.valid_password?(password)
    end
    warden.custom_failure! if performed?
  end

  def index
    return permission_denied_error unless conditions_met

    users = User.all

    render json: users, each_serializer: InsecureUserSerializer 
  end

  def new 
    @user = User.new
  end

  def create
    respond_with current_user.users.build(params[:user])
  end

  private

  def conditions_met
    true # We're not calling this an InsecureUserSerializer for nothing
  end
end