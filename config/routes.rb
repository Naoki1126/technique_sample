Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: "csvtest#csv_test_js", as: 'csv_test_js'
  get 'csv_test_ruby', to: 'csvtest#csv_test_ruby',as: 'csv_test_ruby'
end
