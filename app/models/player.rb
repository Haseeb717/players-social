class Player < ApplicationRecord
	acts_as_followable
	has_attached_file :image, styles: { small: "64x64", med: "100x100", profile: "140x140" }
	validates_attachment_content_type :image, 
                                    :content_type => /^image\/(png|gif|jpeg|jpg)/,
                                    :message => 'only (png/gif/jpeg/jpg) images'
    has_many :posts
    validate :uniqee_user_id, on: :create
    validates :username, uniqueness: { message: "User Name should be uniqee" }, :case_sensitive => false
    after_create :update_username

    def uniqee_user_id
	    user_id = self.username
	    users = Player.where('lower(username) =?',username.downcase)
	    if users.count > 0
	      errors.add(:username, "Username must be uniqee")
	    end
	  end

	  def update_username
	  	self.update_attributes(:username=>self.username.downcase)
	  end

end
