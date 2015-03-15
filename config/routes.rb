Rails.application.routes.draw do

  root 'site#index'

  get 'folhaponto' => 'fills_time#index'

end
