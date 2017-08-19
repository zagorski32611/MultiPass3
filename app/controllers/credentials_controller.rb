class CredentialsController < ApplicationController
  def index
    @credentials = Credentials.new
    @credentials = Credentials.all
  end

  def create
    @credentials = Credentials.new(params[:credentials])
    @credentials.save

  end
  def show
    @credentials = Credentials.find(params[:id])
    redirect_to '/credentials/index'
  end

  def new
    @credentials = Credentials.new(params[:id])
    @credentials.save
  end

private
  def credential_params
    params.require(:user).permit(:website, :username, :password, :tag)
  end
end


=begin

This works: render plain: params[:credential]

This kinda works lol:

def create
  @credentials = Credentials.new(credential_params)
  if @credentials.save
    redirect_to '/credentials'
  else render "/credentials"
  end
end



I don't remember what this is. But it's annoying



def create
  @credentials = Credentials.new(credential_params[:id])
  if @credentials.save
    redirect_to @credentials
  else
    render 'new'
  end
  render "/credentials/index"
end

****************************************************************************
This is the credential CredentialController
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
    @credential = Credential.find(credential_params[:id])
  end

  def new
    @credential = Credential.new
  end

private
  def credential_params
    params.permit(:username, :website, :password, :tag)
  end
=end
