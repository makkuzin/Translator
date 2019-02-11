class WordsController < ApplicationController
  def create
    if @word = Word.find_by(word_params)
      @translation = Word.create(translation_params.merge(meaning_id: word.meaning_id))

    elsif @translation = Word.find_by(translation_params)
      @word = Word.create(word_params.merge(meaning_id: word.meaning_id))

    else
      meaning = Meaning.create
      @word = Word.create(word_params.merge(meaning_id: meaning.id))
      @translation = Word.create(translation_params.merge(meaning_id: meaning.id))
    end
  end

  def search
  end

  private

    def word_params
      params.require(:words).require(:word).permit(:title, :language_id)
    end

    def translation_params
      params.require(:words).require(:translation).permit(:title, :language_id)
    end
end
