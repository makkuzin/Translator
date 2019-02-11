class LanguagesController < ApplicationController
  def create
    @lang = Language.create(language_params)
  end

  private

    def language_params
      params.require(:language).permit(:title, :transcription)
    end
end
