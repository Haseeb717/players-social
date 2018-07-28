class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :posts
  has_many :comments

  has_attached_file :image, styles: { small: "64x64", med: "100x100", profile: "140x140" }
	validates_attachment_content_type :image, 
                                    :content_type => /^image\/(png|gif|jpeg|jpg)/,
                                    :message => 'only (png/gif/jpeg/jpg) images'

  acts_as_followable
  acts_as_follower

  after_create :update_user_id

  def update_user_id
    name = self.name + "_" + self.id.to_s
    self.update_attributes(:user_id=>name)
  end
end
