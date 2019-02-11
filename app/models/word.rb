class Word < ApplicationRecord
  validates :title, presence: true, uniqueness: true

  belongs_to :language
  belongs_to :meaning

  def translations
    meaning.words.where.not(id: id)
  end

  # TODO
  def translations<<()
  end

  # TODO create new meaning on demand, not for existed words
end
