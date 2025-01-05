class MemosController < ApplicationController
before_action :current_user

	def index
	  @memo_new = Memo.new
	  @memos = @current_user.memos  
	# @memos = Memo.where(user_id: @current_user.id)
	end
  
	def create
		@memo_new = Memo.new(memos_params)
		@memo_new.user_id = @current_user.id
		@memos =  @current_user.memos
		if @memo_new.save
			redirect_to memos_path, notice: "メモの保存に成功しました。"
		else
			redirect_to memos_path, alert: "メモの保存に失敗しました。"
			
		end
	end
	  
	def update
	  @memo = Memo.find(params[:id]) 
  
	   @memo.update(memos_params)
		redirect_to memos_path, notice: "メモを更新しました。"
	 
	end
  
	def destroy
	  @memo = Memo.find(params[:id]) 
  
	  @memo.destroy
		redirect_to memospage_path, alert: "メモを削除しました。"
	end

# app/controllers/memos_controller.rb
# def search
# 	keyword = params[:keyword].to_s.strip
# 	@memos = if keyword.present?
# 			   Memo.where("title LIKE ?", "%#{keyword}%")
# 			 else
# 			   Memo.all
# 			 end
# 	@memo = Memo.new  # もしエラーを表示したい場合は新しいメモを作成
#   end

	def search
		search_word = params[:word]
		@memos = @current_user.memos.where("title LIKE ? or description LiKE ?", "%#{search_word}%", "%#{search_word}%")
		if @memos.count > 0
			flash.now[:notice] = "#{@memos.count}件のメモが見つかりました。"
		else
			flash.now[:alert] = "メモが見つかりませんでした。"
			
		end
	end

	# app/controllers/memos_controller.rb
def memospage
	@memos = Memo.all.presence || [] # デフォルトで空の配列を代入
  end

	# def ajax_create
	# 	@memo_new = Memo.new(memos_params)
	# 	@memos = Memo.all 
	# 	if @memo_new.save
	# 		# flash.now[:notice] = "メモの保存に成功しました。"
	# 		redirect_to root_path, notice:
	# 	else
	# 		# flash.now[:alert] = "メモの保存に失敗しました。"
	# 		redirect_to root_path, notice:
	# 	end
	# end
  
	private
  
	def memos_params
	  params.require(:memo).permit(:title, :description, :user_id)
	end

	

  end