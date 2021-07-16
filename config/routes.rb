# frozen_string_literal: true

Rails.application.routes.draw do
  resources :books, except: %i[edit show new]
end
