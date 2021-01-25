class SessionsController < ApplicationController
  def new
  end

  def create
    @usuario = Usuario.find_by_login(params[:login])
    if @usuario && @usuario.authenticate(params[:password])
      session[:usuario_id] = @usuario.id
      redirect_to @usuario
    else
      redirect_to login_path
    end
  end

  def destroy
    session[:usuario_id] = nil
    redirect_to login_path
  end
end
