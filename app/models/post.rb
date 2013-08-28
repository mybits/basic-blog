class Post < ActiveRecord::Base
	has_many :comments, dependent: :destroy

	validates :title, :text, presence: true
	validates :title,	length: { minimum: 4 } 
end
