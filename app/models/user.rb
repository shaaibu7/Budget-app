class User < ApplicationRecord
    has_many :groups
    has_many :budgets

    validates :name, presence: true
end
