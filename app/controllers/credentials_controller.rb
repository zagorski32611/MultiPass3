class CredentialsController < ApplicationController

  def index
    @credentials = Credentials.all
  end

  def show
  end

  def new
    @credentials = Credentials.new
  end

  def edit
  end

  def create
    @credentials = Credentials.new(credential_params)
    respond_to do |format|
      if @credentials.save
        flash[:success] = 'Password was successfully created.'
        format.html { redirect_to @credentials }
        format.json { render :show, status: :created, location: @credentials }
      else
        format.html { render :new }
        format.json { render json: @credentials.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @todo.update(todo_params)
        flash[:success] = 'Todo was successfully updated.'
        format.html { redirect_to @todo }
        format.json { render :show, status: :ok, location: @todo }
      else
        format.html { render :edit }
        format.json { render json: @todo.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @todo.destroy
    respond_to do |format|
      flash[:danger] = 'Todo was successfully destroyed.'
      format.html { redirect_to todos_url }
      format.json { head :no_content }
    end
  end

private

  def set_credentials
    @todo = Todo.find(params[:id])
  end

  def credential_params
    params.require(:credentials).permit(:website, :username, :password, :tag)
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
