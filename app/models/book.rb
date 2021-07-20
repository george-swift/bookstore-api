# frozen_string_literal: true

class Book < ApplicationRecord
  validates :title, presence: true, length: { minimum: 2, maximum: 60 }
  validates :category, presence: true
  validates :chapter, :percentage, numericality: { only_integer: true }, allow_blank: true
end
