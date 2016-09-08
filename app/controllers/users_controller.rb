class UsersController < ApplicationController
  def show
        @user = User.find(params[:id])
        # debugger
  end

  def new
        @user = User.new
  end

  def create
        @user = User.new( user_params )
        if @user.save
           flash[:success] = "Welcome to the Sample App!" #mensagem temporaria informando o sucesso do cadastro
           redirect_to @user
        else
            render 'new'
        end
  end

  def user_params
    # garante que nos métodos de requisição apenas certos atributos sejam enviados
    # isso frusta tentativas de cross site onde poderia ser tentado (admin = "1") para obter acesso administrativo por exemplo
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
