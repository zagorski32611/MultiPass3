class CredentialsController < ApplicationController
  def index
    @credentials = Credentials.all
  end

  def create
    @credentials = Credentials.new(credential_params[:id])
    if @credentials.save
      redirect_to @credentials.index
    else
      render 'new'
    end
    render "/credentials/index"
  end
  

  def show
    @credentials = Credentials.find(credential_params[:id])
  end

  def new
    @credentials = Credentials.new(credential_params)
    @credentials.save
  end

private
  def credential_params
    params.permit(:username, :website, :password, :tag)
  end
end
