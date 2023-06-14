Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  resources :users, only: [:index, :show] do
    resources :groups, only: [:index, :show, :new, :create, :destroy] do
      resources :budgets, only: [:index, :show, :new, :create, :destroy] do
          resources :budget_groups, only: [:new, :create, :destroy]
       end
    end
  end

  root "pages#splash"

  authenticated :user do
    root 'groups#index', as: :authenticated_root
  end

  unauthenticated do
    get '/', to: redirect('/splash')
  end
end
