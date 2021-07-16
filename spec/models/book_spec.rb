# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Book, type: :model do
  subject(:book) { Book.new(title: 'Test book', author: 'Pragmatic dev', category: 'Learning') }

  describe 'presence validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:category) }
  end

  describe 'server side form validations' do
    it 'is valid with correct attributes' do
      expect(book).to be_valid
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
  end
end
