class Recipe < ApplicationRecord
    belongs_to :user, dependent: :destroy

    validates :name, presence: true
    validates :introduction, presence: true

    before_create :default_image
end
