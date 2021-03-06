class UsersController < ApplicationController
  
  def show 
   @user = User.find(params[:id])
   @microposts = @user.microposts
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      # 保存に成功した場合はトップページへリダイレクト
      flash[:success]= "ユーザー登録を編集しました"
      redirect_to @user
    else
      # 保存に失敗した場合は編集画面へ戻す
      render 'edit'
    end
  end
  def followings
    
    @user  = User.find(params[:id])
    @users = @user.following_users
    render 'show_follow'
  end
  
  def followers
     @user  = User.find(params[:id])
     @users = @user.follower_users
     render 'show_follow'
  end
  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :region, :prof,
                                 :password_confirmation)
  end
end