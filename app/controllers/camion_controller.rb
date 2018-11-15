class CamionController < ApplicationController
  def view
  	@current_user = User.new
  	
  end

  def create
    @current_user = User.new
    @current_user.name = params[:name]
    @current_user.email = params[:email]
    @current_user.save
    if @current_user.valid?
      session[:user_id] = @current_user.id
      flash[:info] = "Vous êtes maintenant inscrit à la newsletter"
      ContactMailer.contact(@current_user).deliver
      redirect_to congratulation_path
    else
      session[:user_id] = nil
      flash[:info] = "Échec de l'inscription à la newsletter"
      redirect_to root_path
    end
  end

  def congratulation
  	
  end
end
