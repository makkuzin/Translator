class Word < ApplicationRecord
  validates :title, presence: true, uniqueness: { case_sensitive: false }

  belongs_to :language
  belongs_to :meaning

  def translations
    meaning.words.where.not(id: id)
  end
end
