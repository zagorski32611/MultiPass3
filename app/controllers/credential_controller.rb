class CredentialController < ApplicationController
  def index
    @credential = Credential.all
  end

  def create
    @credential = Credential.new(credential_params)
    @credential.save
    redirect_to @credential
  end
  
  def show
    @credential = Credential.find(params[:id])
  end
private
  def credential_params
    params.require(:username).permit(:website, :password, :tag)
  end
end
