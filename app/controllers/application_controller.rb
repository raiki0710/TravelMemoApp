class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  def current_user
	if session[:user_id]
		@current_user = User.find (session[:user_id])
	else
		redirect_to new_sessions_path, alert: "ログインする必要があります。"
	end
end

  def logged_in?
	  if  session[:user_id]
		  @current_user = User.find(session[:user_id])
		  redirect_to memos_path, notice: "すでにログインしています。"
	  end
  end

  

end
