class Language < ApplicationRecord
  validates :title, :transcription, presence: true
  validates :transcription, uniqueness: true


end
