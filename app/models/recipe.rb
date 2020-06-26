class Recipe < ApplicationRecord
    before_create :default_images
    belongs_to :user
    belongs_to :group, optional: true
    has_many_attached :images
    has_many :comments
    validates :name, presence: true
    validates :introduction, presence: true

end
