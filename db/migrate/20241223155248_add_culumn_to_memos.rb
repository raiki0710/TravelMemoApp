class AddCulumnToMemos < ActiveRecord::Migration[8.0]
	def change
		add_column :memos, :user_id, :integer
	  end
end
