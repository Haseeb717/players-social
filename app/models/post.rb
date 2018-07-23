class Post < ApplicationRecord
  belongs_to :user
  belongs_to :player, optional: true
  has_many :tags
  has_many :comments
  has_attached_file :image, styles: { small: "64x64", med: "100x100", profile: "140x140" }
	validates_attachment_content_type :image, 
                                    :content_type => /^image\/(png|gif|jpeg|jpg)/,
                                    :message => 'only (png/gif/jpeg/jpg) images'
end
