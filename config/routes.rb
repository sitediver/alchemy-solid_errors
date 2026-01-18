Alchemy::Engine.routes.draw do
  namespace :admin, path: Alchemy.admin_path, constraints: Alchemy.admin_constraints do
    resources :errors, only: [:index]
    mount SolidErrors::Engine, at: "/solid_errors"
  end
end