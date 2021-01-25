class ApplicationController < ActionController::Base
  helper_method :logged_in?, :current_user

  # retorna o usuario atual da sessão
  def current_user
    if session[:usuario_id]
      @usuario = Usuario.find(session[:usuario_id])
    end
  end

  # verifica se existe usuario logado
  def logged_in?
    !!current_user
  end

  # se não estiver logado, vai para a tela de login
  def authorized
    redirect_to login_path unless logged_in?
  end
end
