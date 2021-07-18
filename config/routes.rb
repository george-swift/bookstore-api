# frozen_string_literal: true

Rails.application.routes.draw do
  resources :books, except: %i[show new]
end
