class SessionsController < ApplicationController
before_action :logged_in?, only: [:new, :create]
	def new
		@memo = Memo.new
	end


	  def create
		@current_user = User.find_by(email: params[:email], password: params[:password])
		if @current_user
		  session[:user_id] = @current_user.id
		  redirect_to memos_path, notice: "ログインに成功しました。"
		else
		  respond_to do |format|
			format.turbo_stream do
			  flash.now[:alert] = "ログインに失敗しました。"
			  render turbo_stream: turbo_stream.replace(
				"flash", partial: "layouts/flash", locals: { flash: flash }
			  )
			end
			format.html { redirect_to new_sessions_path, alert: "ログインに失敗しました。" }
		  end
		end
	  end

	def destroy
		session[:user_id] = nil 
		redirect_to new_sessions_path, notice: "ログアウトしました。"
		# respond_to do |format|
		# 	format.turbo_stream { flash.now[:notice] = "ログアウトしました。" }
		# 	format.html { redirect_to new_sessions_path, notice: "ログアウトしました。" }
		#   end
	end

	
end
