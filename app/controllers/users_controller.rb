class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def delete_user
    @user = User.find(params[:id])
    @user.delete
    if @user.delete
      redirect_to users_index_path, notice: "¡Usuario eliminado!"
    end
  end

  def toggle_role
    @user = User.find(params[:id])
    puts "User's old role was: #{@user.role}"
    if @user.editor?
      @user.admin!
    else
      @user.editor!
    end
    @user.save!
    redirect_to users_index_path, notice: "¡Rol modificado!"if @user.save
  end

  private

  def resource_name
    :user
  end
  helper_method :resource_name

  def resource
    @resource ||= User.new
  end
  helper_method :resource

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
  helper_method :devise_mapping

  def resource_class
    User
  end
  helper_method :resource_class

end
