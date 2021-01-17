Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: "csvtest#csv_test_js", as: 'csv_test_js'
  get 'csv_test_ruby', to: 'csvtest#csv_test_ruby',as: 'csv_test_ruby'
  get 'js_practice_first', to: 'js_practice#practice_first',as: 'js_practice_first'
  get 'js_practice_second', to: 'js_practice#practice_second',as: 'js_practice_second'
  get 'js_practice_third', to: 'js_practice#practice_third',as: 'js_practice_third'
  get 'session/read', to: 'session#read'
  post 'session/save',to: 'session#save'
  delete 'session/delete',to: 'session#destroy'
  
end
