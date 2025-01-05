class UsersController < ApplicationController
	before_action :current_user, only: [:show, :edit, :update]
	before_action :logged_in?, only: [:new, :create]



	def new
		@user_new = User.new
	end

	
	def show
		@user = User.find(session[:user_id])
	end
	# if @user.nil?
		#   redirect_to root_path, alert: "ユーザーが見つかりません。"
		# end

	def edit
		@user = User.find(session[:user_id])
	end

	def create
		@user_new = User.new(user_params)
		if @user_new.save
			session[:user_id] = @user_new.id
			redirect_to memos_path, notice: "ユーザーの新規登録に成功しました。"
		else
			respond_to do |format|
				format.turbo_stream do
				  render turbo_stream: turbo_stream.replace(
					"flash", partial: "layouts/flash", locals: { flash: flash }
				  )
				end
				format.html { redirect_to new_users_path, alert: "ユーザーの新規作成に失敗しました。" }
			  end
		end
	end

	def update
		@user = User.find(session[:user_id])
		if @user.update(user_params)
			redirect_to memos_path, notice: "ユーザー情報の更新に成功しました。"
		else
			redirect_to users_path, notice: "ユーザー情報の更新に失敗しました。"
		end
	end

	
	# def index
	# 	  @users = User.all
	# 	  # 必要に応じてビューやJSONを返す
	# 	  render json: @users
	# end


	private
	def user_params
		params.require(:user).permit(:name, :email, :password)
	end


end
