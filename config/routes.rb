Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "csvtest#csv_output_test_js", as: 'csv_test_js'
  get 'csv_test_ruby', to: 'csvtest#csv_test_ruby',as: 'csv_test_ruby'
  get 'output_to_table_with_a_js', to: 'csvtest#output_to_message_with_a_js',as: 'output_to_message_with_a_js'
  get 'output_to_message_with_a_js', to: 'csvtest#output_to_message_with_a_js2',as: 'output_to_message_with_a_js2'
  get 'save_to_readcount_for_session', to: 'csvtest#save_to_readcount_for_session',as: 'save_to_readcount_for_session'
  get 'check_localstrage_read',to: 'csvtest#check_localstorage_read',as: 'check_localstorage_read'
  get 'save_to_readcount_for_localstorage',to: 'csvtest#save_to_readcount_for_localstorage',as: 'save_to_readcount_for_localstorage'
  get 'session/read', to: 'session#read'
  post 'session/save',to: 'session#save'
  post 'session/delete',to: 'session#destroy',as: 'session_delete'


  resources :posts
end
