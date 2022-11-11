Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'booking#index'
  get '/cancel_booking/:id', to: 'bookings#cancel_booking', as: 'cancel_booking'
  get '/local_records/', to: 'bookings#local_records', as: 'local_records'
  resources :bookings
end
