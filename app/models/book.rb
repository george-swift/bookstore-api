# frozen_string_literal: true

class Book < ApplicationRecord
  validates :title, presence: true, length: { minimum: 2, maximum: 60 }
  validates :category, presence: true
end
