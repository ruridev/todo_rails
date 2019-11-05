Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :todos, path: 'todo' do
        collection do
          get 'list/:year', to: 'todos#index'
          get 'list/:year/:month', to: 'todos#index'
          get 'list/:year/:month/:day', to: 'todos#index'
        end
      end


get 'photos/:id/:user_id', to: 'photos#show'
    end
  end
end
