class CredentialsController < ApplicationController
  def index
    @credentials = Credentials.new
    @credentials = Credentials.all
  end

  def create
    @credentials = Credentials.new(params[:credentials])
    redirect_to 'credentials'

    @credentials.save

  end
  def show
    @credentials = Credentials.find(params[:id])
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
=end
