Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  post 'convert_to_zip' => "home#convert_to_zip"
  post 'extract_from_zip' => "home#extract_from_zip"
end
