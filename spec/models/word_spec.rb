require 'rails_helper'

RSpec.describe Word, type: :model do
  context 'validations' do
    let!(:language) { Language.create title: 'English', transcription: 'en' }
    let!(:meaning) { Meaning.create }
    let(:word) { Word.new language_id: language.id, meaning_id: meaning.id }

    it 'title should not be nil' do
      expect(word).to be_invalid
      expect("can't be blank").to be_in(word.errors[:title])
    end

    it 'title should not be empty' do
      word.title = ''
      expect(word).to be_invalid
      expect("can't be blank").to be_in(word.errors[:title])
    end

    it 'title must be uniq' do
      word.title = 'Word'
      expect(word).to be_valid

      word2 = word.dup
      word.save

      expect(word2).to be_invalid
      expect("has already been taken").to be_in(word2.errors[:title])

      word2.title = word2.title.upcase
      expect(word2).to be_invalid
      expect("has already been taken").to be_in(word2.errors[:title])
    end

    it 'must belong to language' do
      word = Word.new
      expect(word).to be_invalid
      expect('must exist').to be_in(word.errors[:language])
    end

    it 'must belong to meaning' do
      word = Word.new
      expect(word).to be_invalid
      expect('must exist').to be_in(word.errors[:meaning])
    end
  end

  context 'associations' do
    it 'belongs to language' do
      language = Language.create title: 'English', transcription: 'en'
      word = language.words.build title: 'Word'

      expect(word.language).to eq(language)
      expect(word).to be_in(language.words)
    end

    it 'belongs to meaning' do
      meaning = Meaning.create
      word = meaning.words.build title: 'Word'

      expect(word.meaning).to eq(meaning)
      expect(word).to be_in(meaning.words)
    end

    it 'has many translations' do
      meaning = Meaning.create

      eng_lang = Language.create title: 'English', transcription: 'en'
      word = eng_lang.words.create title: 'Word',
        meaning_id: meaning.id

      rus_lang = Language.create title: 'Russian', transcription: 'ru'
      translation = rus_lang.words.create title: 'Translation',
        meaning_id: meaning.id

      expect(translation).to be_in(word.translations)
      expect(word).to be_in(translation.translations)
    end
  end
end
