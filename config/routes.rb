Rails.application.routes.draw do
  root 'schoolhouses#index'

  resources :schoolhouses do
  	resources :classrooms
  end

end
