Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'films' => 'films#index', as: 'films'
  root 'films#index'
  get 'films/new' => 'films#new', as: 'film_new'
  get 'films/:id' => 'films#show', as: 'film'
  get 'films/:id/edit' => 'films#edit', as: 'film_edit'
  post 'films' => 'films#create', as: 'film_create'
  patch 'films/:id' => 'films#update', as: 'film_update'
  delete 'films/:id' => 'films#delete', as: 'film_delete'

end
