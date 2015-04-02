Rails.application.routes.draw do

  root 'site#index'

  get 'folhaponto', :to => redirect('folhaponto/2015/apr')
  get 'folhaponto/2015/jan', :to => 'fills_time#jan', :as => :fills_time_jan
  get 'folhaponto/2015/feb', :to => 'fills_time#feb', :as => :fills_time_feb
  get 'folhaponto/2015/mar', :to => 'fills_time#mar', :as => :fills_time_mar
  get 'folhaponto/2015/apr', :to => 'fills_time#apr', :as => :fills_time_apr
  get 'folhaponto/2015/may', :to => 'fills_time#may', :as => :fills_time_may
  get 'folhaponto/2015/jun', :to => 'fills_time#jun', :as => :fills_time_jun

end
