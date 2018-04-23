class UsersController < ApplicationController
  # ユーザ一覧
  def index
  	@users = User.order(:id)
  end

  # ユーザ詳細
  def show
  	@user = User.find(params[:id])
  end

  # 新規作成フォーム
  def new
 	  @user = User.new
  end

  # 更新フォーム
  def edit
 	  @user = User.find(params[:id])
  end

  # ユーザ新規登録
  def create
 	  @user = User.new(user_params)
 	  if @user.save
 	    redirect_to @user, notice: "ユーザを登録しました"
 	  else
 	    render "new"
 	  end
  end

  # ユーザ情報の更新
  def update
  	@user = User.find(params[:id])
  	@user.assign_attributes(user_params)
  	if @user.save
  	  redirect_to @user, notice: "ユーザを更新しました"
  	else
  	  render "edit"
  	end
  end

  # ユーザの削除
  def destroy
  	@user = User.find(params[:id])
  	@user.destroy
  	redirect_to :users, notice: "ユーザを削除しました"
  end

  private
  def user_params
    params.require(:user).permit(:name, :business)
  end
end
