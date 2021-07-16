# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BooksController, type: :controller do
  let(:valid_book_params) do
    { title: 'Test Book', author: 'Pragmatic Dev', category: 'Learning' }
  end

  let(:invalid_book_params) do
    { title: nil, category: '' }
  end

  describe 'GET #index' do
    before { get :index }
    it { expect(response).to have_http_status(:success) }
  end

  describe 'POST #create' do
    context 'with invalid params' do
      it 'does not create a new book' do
        expect do
          post :create, params: { book: invalid_book_params }
        end.to change(Book, :count).by(0)
      end

      it 'returns status code 422' do
        post :create, params: { book: invalid_book_params }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end

    context 'with valid book params' do
      it 'creates a new book' do
        expect do
          post :create, params: { book: valid_book_params }
        end.to change(Book, :count).by(1)
        expect(response).to have_http_status(200)
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'deletes a requested book' do
      book = Book.create(title: 'Demo 101', category: 'Action')
      expect do
        delete :destroy, params: { id: book.to_param }
      end.to change(Book, :count).by(-1)
    end
  end
end
