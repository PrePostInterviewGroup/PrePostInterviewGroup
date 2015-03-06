class RegistrationsController < Devise::RegistrationsController
def create
  @user = User.new(user_params)
  binding.pry
  if @user.save
    render json: { user: @user.as_json(:only => [:username, :email, :auth_token]) }, status: :created
  else
    render json: { :messages => @user.errors.full_messages },
      status: :unprocessable_entity
  end
end

  private
  def user_params
    params.require(:user).permit(:email, :password, :username)
  end
end
