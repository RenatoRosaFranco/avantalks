# frozen_string_literal: true

Rails.application.routes.draw do

  # Authentication
  devise_for :users

  root to: 'talks#index'

  # Application
  scope :dashboard do
    resources :talks
  end
end
