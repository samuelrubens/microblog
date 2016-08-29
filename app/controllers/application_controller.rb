class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # pagina incial para evitar conflitos no heroku com a pagina padrão do rails

end
