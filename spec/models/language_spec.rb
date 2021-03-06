require 'rails_helper'

RSpec.describe Language, type: :model do
  context 'validations' do
    let(:language) { Language.new }

    it 'title should not be nil' do
      expect(language).to be_invalid
      expect("can't be blank").to be_in(language.errors[:title])
    end

    it 'title should not be empty' do
      language.title = ''
      expect(language).to be_invalid
      expect("can't be blank").to be_in(language.errors[:title])
    end

    it 'transcription should not be nil' do
      expect(language).to be_invalid
      expect("can't be blank").to be_in(language.errors[:transcription])
    end

    it 'transcription should not be empty' do
      language.transcription = ''
      expect(language).to be_invalid
      expect("can't be blank").to be_in(language.errors[:transcription])
    end

    it 'transcription must be uniq' do
      language.title = 'English'
      language.transcription = 'en'
      expect(language).to be_valid

      language2 = language.dup
      language.save

      expect(language2).to be_invalid
      expect("has already been taken").to be_in(language2.errors[:transcription])

      language2.transcription = language2.transcription.upcase
      expect(language2).to be_invalid
      expect("has already been taken").to be_in(language2.errors[:transcription])
    end
  end

  context 'associations' do
    let(:language) { Language.create title: 'English', transcription: 'en' }

    it 'has many words' do
      language.words.build title: 'Word1'
      language.words.build title: 'Word2'

      expect(language.words.size).to eq(2)
    end
  end
end
