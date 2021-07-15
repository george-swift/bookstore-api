# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Book, type: :model do
  subject(:book) { Book.new(title: 'Test book', author: 'Pragmatic dev', category: 'Learning') }

  describe 'general model validations' do
    it 'is valid with correct attributes' do
      expect(book).to be_valid
    end

    it 'is not valid without a title' do
      book.category = ''
      expect(book).to_not be_valid
      book.title = nil
      expect(book).to_not be_valid
    end

    it 'is not valid if title is less than 2 characters' do
      book.title = 'b'
      expect(book).to_not be_valid
      book.title = 'b' * 3
      expect(book).to be_valid
    end

    it 'is not valid if title is longer than 60 characters' do
      book.title = 'test' * 16
      expect(book).to_not be_valid
      book.title = 'test' * 15
      expect(book).to be_valid
    end

    it 'is not valid without a category' do
      book.category = nil
      expect(book).to_not be_valid
      book.category = ''
      expect(book).to_not be_valid
    end
  end
end
