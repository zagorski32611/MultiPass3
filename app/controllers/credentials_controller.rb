class CredentialsController < ApplicationController
  def index
    @credential = Credential.all
  end

  def create
    @credential = Credential.new(credential_params)
    @credential.save
    redirect_to @credential.index
  end

  def show
    @credential = Credential.find(credential_params[:id])
  end

  def new
    @credential = Credential.new
  end

private
  def credential_params
    params.permit(:username, :website, :password, :tag)
  end
end
