class Memo < ApplicationRecord
	belongs_to :user, class_name: "User", foreign_key: "user_id"

	validates :user_id, presence: true
	validates :title, presence: true, length: {minimum: 2, maximum: 32}
	validates :description, presence: true, length: {minimum: 2, maximum: 140}
end

