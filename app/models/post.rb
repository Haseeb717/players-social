class Post < ApplicationRecord
  belongs_to :user
  belongs_to :player, optional: true
  has_many :tags,:dependent => :destroy
  has_many :comments,:dependent => :destroy
  has_many :tag_users,:dependent => :destroy
  has_attached_file :image,:storage => :cloudinary, styles: { small: "64x64", med: "100x100", profile: "140x140" },:path => ":env_folder/:attachment/:id/:style/:filename"
	validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

	private
	# interpolate in paperclip
	Paperclip.interpolates :env_folder  do |attachment, style|
	  Rails.env.production? ? 'production' : 'development'
	end

end
