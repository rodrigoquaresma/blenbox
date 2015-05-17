Rails.application.routes.draw do

  get 'ux-calculators', :to => 'ux_calculators#index', :as => :ux_calculators
  get 'uxcalculators', :to => redirect('ux-calculators')

  get 'chi-square', :to => 'chi_square#index', :as => :chi_square
  get 'chisquare', :to => redirect('chi-square')
  get 'chi_square', :to => redirect('chi-square')

  match 'chi-square/calculate', :to => "chi_square#calculate", :via => 'post', :as => :chi_calculate

  root 'site#index'

  get '/', :to => 'site#index', :as => :site_index

  # get 'folhaponto', :to => redirect('folhaponto/2015/apr'), :as => :fills_time
  get 'folhaponto/2015/jan', :to => 'fills_time#jan', :as => :fills_time_jan
  get 'folhaponto/2015/feb', :to => 'fills_time#feb', :as => :fills_time_feb
  get 'folhaponto/2015/mar', :to => 'fills_time#mar', :as => :fills_time_mar
  get 'folhaponto/2015/apr', :to => 'fills_time#apr', :as => :fills_time_apr
  get 'folhaponto/2015/may', :to => 'fills_time#may', :as => :fills_time_may
  get 'folhaponto/2015/jun', :to => 'fills_time#jun', :as => :fills_time_jun

  get 'folhaponto', :to => 'fills_time#index', :as => :fills_time
  match 'folhaponto/calculate', :to => "fills_time#calculate", :via => 'post', :as => :fills_time_calculate

end
