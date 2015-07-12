Rails.application.routes.draw do

  get 'churrascometro', :to => 'bbq#index', :as => :bbq
  match 'churrascometro/resultado', :to => "bbq#calculate", :via => 'post', :as => :bbq_calculate

  get 'ux-calculators', :to => 'ux_calculators#index', :as => :ux_calculators
  get 'uxcalculators', :to => redirect('ux-calculators')

  get 'ux-calculators/continuous/',                                                      :to => 'ux_calculators#cn',                :as => :uxcal_cn
  get 'ux-calculators/continuous/comparing-data-yes',                                    :to => 'ux_calculators#cn_cd_y',           :as => :uxcal_cn_cd_y
  get 'ux-calculators/continuous/comparing-data-yes/diferent-users-yes',                 :to => 'ux_calculators#cn_cd_y_du_y',      :as => :uxcal_cn_cd_y_du_y
  get 'ux-calculators/continuous/comparing-data-yes/diferent-users-yes/more-groups-yes', :to => 'ux_calculators#cn_cd_y_du_y_mg_y', :as => :uxcal_cn_cd_y_du_y_mg_y
  get 'ux-calculators/continuous/comparing-data-yes/diferent-users-yes/more-groups-no',  :to => 'ux_calculators#cn_cd_y_du_y_mg_n', :as => :uxcal_cn_cd_y_du_y_mg_n
  get 'ux-calculators/continuous/comparing-data-yes/diferent-users-no',                  :to => 'ux_calculators#cn_cd_y_du_n',      :as => :uxcal_cn_cd_y_du_n
  get 'ux-calculators/continuous/comparing-data-yes/diferent-users-no/more-groups-yes',  :to => 'ux_calculators#cn_cd_y_du_n_mg_y', :as => :uxcal_cn_cd_y_du_n_mg_y
  get 'ux-calculators/continuous/comparing-data-yes/diferent-users-no/more-groups-no',   :to => 'ux_calculators#cn_cd_y_du_n_mg_n', :as => :uxcal_cn_cd_y_du_n_mg_n
  get 'ux-calculators/continuous/comparing-data-no',                                     :to => 'ux_calculators#cn_cd_n',           :as => :uxcal_cn_cd_n
  get 'ux-calculators/continuous/comparing-data-no/against-bench-yes',                   :to => 'ux_calculators#cn_cd_n_ab_y',      :as => :uxcal_cn_cd_n_ab_y
  get 'ux-calculators/continuous/comparing-data-no/against-bench-yes/task-time-yes',     :to => 'ux_calculators#cn_cd_n_ab_y_tt_y', :as => :uxcal_cn_cd_n_ab_y_tt_y
  get 'ux-calculators/continuous/comparing-data-no/against-bench-yes/task-time-no',      :to => 'ux_calculators#cn_cd_n_ab_y_tt_n', :as => :uxcal_cn_cd_n_ab_y_tt_n
  get 'ux-calculators/continuous/comparing-data-no/against-bench-no',                    :to => 'ux_calculators#cn_cd_n_ab_n',      :as => :uxcal_cn_cd_n_ab_n
  get 'ux-calculators/continuous/comparing-data-no/against-bench-no/task-time-yes',      :to => 'ux_calculators#cn_cd_n_ab_n_tt_y', :as => :uxcal_cn_cd_n_ab_n_tt_y
  get 'ux-calculators/continuous/comparing-data-no/against-bench-no/task-time-no',       :to => 'ux_calculators#cn_cd_n_ab_n_tt_n', :as => :uxcal_cn_cd_n_ab_n_tt_n

  get 'ux-calculators/binary',                                                                          :to => 'ux_calculators#bn',                     :as => :uxcal_bn
  get 'ux-calculators/binary/comparing-groups-yes',                                                     :to => 'ux_calculators#bn_cg_y',                :as => :uxcal_bn_cg_y
  get 'ux-calculators/binary/comparing-groups-yes/diferent-users-yes',                                  :to => 'ux_calculators#bn_cg_y_du_y',           :as => :uxcal_bn_cg_y_du_y
  get 'ux-calculators/binary/comparing-groups-yes/diferent-users-yes/more-groups-yes',                  :to => 'ux_calculators#bn_cg_y_du_y_mg_y',      :as => :uxcal_bn_cg_y_du_y_mg_y
  get 'ux-calculators/binary/comparing-groups-yes/diferent-users-yes/more-groups-yes/large-sample-yes', :to => 'ux_calculators#bn_cg_y_du_y_mg_y_ls_y', :as => :uxcal_bn_cg_y_du_y_mg_ls_y
  get 'ux-calculators/binary/comparing-groups-yes/diferent-users-yes/more-groups-yes/large-sample-no',  :to => 'ux_calculators#bn_cg_y_du_y_mg_y_ls_n', :as => :uxcal_bn_cg_y_du_y_mg_ls_n
  get 'ux-calculators/binary/comparing-groups-yes/diferent-users-yes/more-groups-no',                   :to => 'ux_calculators#bn_cg_y_du_y_mg_n',      :as => :uxcal_bn_cg_y_du_y_mg_n
  get 'ux-calculators/binary/comparing-groups-yes/diferent-users-no',                                   :to => 'ux_calculators#bn_cg_y_du_n',           :as => :uxcal_bn_cg_y_du_n
  get 'ux-calculators/binary/comparing-groups-yes/diferent-users-no/more-groups-yes',                   :to => 'ux_calculators#bn_cg_y_du_n_mg_y',      :as => :uxcal_bn_cg_y_du_n_mg_y
  get 'ux-calculators/binary/comparing-groups-yes/diferent-users-no/more-groups-no',                    :to => 'ux_calculators#bn_cg_y_du_n_mg_n',      :as => :uxcal_bn_cg_y_du_n_mg_n
  get 'ux-calculators/binary/comparing-groups-no',                                                      :to => 'ux_calculators#bn_cg_n',                :as => :uxcal_bn_cg_n
  get 'ux-calculators/binary/comparing-groups-no/against-bench-yes',                                    :to => 'ux_calculators#bn_cg_n_ab_y',           :as => :uxcal_bn_cg_n_ab_y
  get 'ux-calculators/binary/comparing-groups-no/against-bench-no',                                     :to => 'ux_calculators#bn_cg_n_ab_n',           :as => :uxcal_bn_cg_n_ab_n

  get 'ab-testing-calculator', :to => 'chi_square#index', :as => :chi_square
  get 'chi-square', :to => redirect('ab-testing-calculator')
  get 'chisquare', :to => redirect('ab-testing-calculator')
  get 'chi_square', :to => redirect('ab-testing-calculator')

  match 'ab-testing-calculator/result', :to => "chi_square#calculate", :via => 'post', :as => :chi_calculate

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
