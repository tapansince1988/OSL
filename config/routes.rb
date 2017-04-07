Rails.application.routes.draw do

    root "site#index"

    # namespace :admin do |admin|
    #   resources :admin_user, :city, :store
    # end

    match ':controller(/:action(/:id))', :via => [:get, :post]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
