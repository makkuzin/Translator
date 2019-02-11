class Meaning < ApplicationRecord
  has_many :words, dependent: :destroy
end
