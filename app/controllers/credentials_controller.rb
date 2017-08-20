class CredentialsController < ApplicationController

  def index
    @credentials = Credentials.all
  end

  def show
    @credentials = Credentials.find(params[:id])
  end

  def new
    @credentials = Credentials.new
  end

  def edit
    @credentials = Credentials.find(params[:id])
  end

  def create
    @credentials = Credentials.new(credential_params)

    if @credentials.save
      redirect_to @credentials
    else
      render 'new'
    end
  end

  def update
    @credentials = Credentials.find(params[:id])

    if @credentials.update(credential_params)
      redirect_to @credentials
    else
      render 'edit'
    end
  end

  def destroy
    @credentials = Credentials.find(params[:id])
    @credentials.destroy

    redirect_to credentials_path
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
