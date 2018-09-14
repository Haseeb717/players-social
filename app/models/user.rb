class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :posts,:dependent => :destroy
  has_many :comments,:dependent => :destroy
  after_create :update_username


  validate :uniqee_user_id, on: :create

  has_attached_file :image, styles: { small: "64x64", med: "100x100", profile: "140x140" }
	validates_attachment_content_type :image, 
                                    :content_type => /^image\/(png|gif|jpeg|jpg)/,
                                    :message => 'only (png/gif/jpeg/jpg) images'

  acts_as_followable
  acts_as_follower

  def uniqee_user_id
    user_id = self.user_id
    users = User.where('lower(user_id) =?',user_id.downcase)
    if users.count > 0
      errors.add(:user_id, "User Id must be uniqee")
    end
  end

  def update_username
    self.update_attributes(:user_id=>self.user_id.downcase)
  end
end
