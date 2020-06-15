class User < ApplicationRecord
    validates :name, presence: true, length: { maximum: 40 }
    validates :email, presence: true, uniqueness: true
    validates :introduction, length: { maximum: 300 }

    before_create :default_image

    has_secure_password
    has_one_attached :image
    has_many :recipes, dependent: :destroy
    has_many :group_members
    has_many :groups, through: :group_members
    has_many :comments

end
