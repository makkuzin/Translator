class Language < ApplicationRecord
  validates :title, presence: true
  validates :transcription, presence: true, uniqueness: true

  has_many :words, dependent: :destroy
end
