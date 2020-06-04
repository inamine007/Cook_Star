class Recipe < ApplicationRecord
    before_create :default_images
    belongs_to :user
    has_many_attached :images

    validates :name, presence: true
    validates :introduction, presence: true

end
