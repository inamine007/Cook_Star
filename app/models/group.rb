class Group < ApplicationRecord
    has_many :group_members
    has_many :users, through: :group_members
    has_many :recipes, dependent: :destroy

    validates :name, presence: true
    validates :password, presence: true, length: { is: 4 }

    
end
