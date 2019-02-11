class Language < ApplicationRecord
  validates :title, presence: true
  validates :transcription, presence: true, uniqueness: { case_sensitive: false }

  has_many :words, dependent: :destroy
end
