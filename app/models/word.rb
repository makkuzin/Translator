class Word < ApplicationRecord
  validates :title, presence: true, uniqueness: true

  belongs_to :language
end
