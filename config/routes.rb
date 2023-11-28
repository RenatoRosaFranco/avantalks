# frozen_string_literal: true

Rails.application.routes.draw do

  devise_for :users
  # Application
  namespace :dashboard do
    resources :talks
  end
end
