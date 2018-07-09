class Player < ApplicationRecord
	acts_as_followable
	has_attached_file :image, styles: { small: "64x64", med: "100x100", profile: "140x140" }
	validates_attachment_content_type :image, 
                                    :content_type => /^image\/(png|gif|jpeg|jpg)/,
                                    :message => 'only (png/gif/jpeg/jpg) images'
    has_many :posts
end
