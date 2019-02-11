require 'rails_helper'

RSpec.describe Language, type: :model do
  context 'validations' do
    let(:language) { Language.new }

    it 'title should not be empty' do
      expect(language).to be_invalid
      expect("can't be blank").to be_in(language.errors[:title])
    end

    it 'transcription should not be empty' do
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
      expect(language2.errors.size).to eq(1)
      expect("has already been taken").to be_in(language2.errors[:transcription])
    end
  end
end
