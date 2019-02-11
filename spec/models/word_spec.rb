require 'rails_helper'

RSpec.describe Word, type: :model do
  context 'validations' do
    let!(:language) { Language.create title: 'English', transcription: 'en' }
    let(:word) { Word.new language_id: language.id }

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
      word.title = 'Title'
      expect(word).to be_valid

      word2 = word.dup
      word.save

      expect(word2).to be_invalid
      expect("has already been taken").to be_in(word2.errors[:title])
    end

    it 'must belong to language' do
      word = Word.new
      expect(word).to be_invalid
      expect('must exist').to be_in(word.errors[:language])
    end
  end
end
