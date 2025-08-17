class Task < ApplicationRecord
    scope :active, -> { where(deleted: false) }
end
