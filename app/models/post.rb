class Post < ActiveRecord::Base

	validates :title, :presence => true
	belongs_to :user
	has_many :comments
	
	has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }

end
