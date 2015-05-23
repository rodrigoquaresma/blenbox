class UxCalculatorsController < ApplicationController

  def index
  end

  def cn
    @ask = 'Comparing data?'
    @ask_help = ''
    @answer_y = 'cn_cd_y'
    @answer_n = 'cn_cd_n'
    render 'cn'
  end
  def cn_cd_y
    @ask = 'Diferent users in each group?'
    @ask_help = ''
    @answer_y = 'cn_cd_y_du_y'
    @answer_n = 'cn_cd_y_du_n'
    render 'cn'
  end
  def cn_cd_y_du_y
    @ask = '3 or more groups?'
    @ask_help = ''
    @answer_y = 'cn_cd_y_du_y_mg_y'
    @answer_n = 'cn_cd_y_du_y_mg_n'
    render 'cn'
  end
  def cn_cd_y_du_y_mg_y
    @formula = "A - ANOVA"
    render 'show_formula'
  end
  def cn_cd_y_du_y_mg_n
    @formula = "2t - 2-sample t"
    render 'show_formula'
  end

  def cn_cd_y_du_n
    @ask = '3 or more groups?'
    @ask_help = ''
    @answer_y = 'cn_cd_y_du_n_mg_y'
    @answer_n = 'cn_cd_y_du_n_mg_n'
    render 'cn'
  end
  def cn_cd_y_du_n_mg_y
    @formula = "Arm - Within subjects ANOVA"
    render 'show_formula'
  end
  def cn_cd_y_du_n_mg_n
    @formula = "tt - paired t"
    render 'show_formula'
  end

  def cn_cd_n
    @ask = 'Testing against a benchmark?'
    @ask_help = ''
    @answer_y = 'cn_cd_n_ab_y'
    @answer_n = 'cn_cd_n_ab_n'
    render 'cn'
  end
  def cn_cd_n_ab_y
    @ask = 'Task time?'
    @ask_help = ''
    @answer_y = 'cn_cd_n_ab_y_tt_y'
    @answer_n = 'cn_cd_n_ab_y_tt_n'
    render 'cn'
  end
  def cn_cd_n_ab_y_tt_y
    @formula = "tlog - 1-Sample t (log)"
    render 'show_formula'
  end
  def cn_cd_n_ab_y_tt_n
    @formula = "t - 1-Sample t"
    render 'show_formula'
  end

  def cn_cd_n_ab_n
    @ask = 'Task time?'
    @ask_help = ''
    @answer_y = 'cn_cd_n_ab_n_tt_y'
    @answer_n = 'cn_cd_n_ab_n_tt_n'
    render 'cn'
  end
  def cn_cd_n_ab_n_tt_y
    @formula = "tlog - t (LOG) conf. interval"
    render 'show_formula'
  end
  def cn_cd_n_ab_n_tt_n
    @formula = "t - t conf. interval"
    render 'show_formula'
  end

  def bn
    @ask = 'Comparing groups?'
    @ask_help = ''
    @answer_y = 'bn_cg_y'
    @answer_n = 'bn_cg_n'
    render 'bn'
  end
  def bn_cg_y
    @ask = 'Different users in each group?'
    @ask_help = ''
    @answer_y = 'bn_cg_y_du_y'
    @answer_n = 'bn_cg_y_du_n'
    render 'bn'
  end
  def bn_cg_y_du_y
    @ask = '3 or more groups?'
    @ask_help = ''
    @answer_y = 'bn_cg_y_du_y_mg_y'
    @answer_n = 'bn_cg_y_du_y_mg_n'
    render 'bn'
  end
  def bn_cg_y_du_y_mg_y
    @ask = 'Large sample?'
    @ask_help = ''
    @answer_y = 'bn_cg_y_du_y_mg_y_ls_y'
    @answer_n = 'bn_cg_y_du_y_mg_y_ls_n'
    render 'bn'
  end
  def bn_cg_y_du_y_mg_y_ls_y
    @formula = "chi-square"
    render 'show_formula'
  end
  def bn_cg_y_du_y_mg_y_ls_n
    @formula = "2p - N-1 two proportion test on pairs"
    render 'show_formula'
  end
  def bn_cg_y_du_y_mg_n
    @formula = "2p - N-1 two proportion test"
    render 'show_formula'
  end

  def bn_cg_y_du_n
    @ask = '3 or more groups?'
    @ask_help = ''
    @answer_y = 'bn_cg_y_du_n_mg_y'
    @answer_n = 'bn_cg_y_du_n_mg_n'
    render 'bn'
  end
  def bn_cg_y_du_n_mg_y
    @formula = "pp - McNemher Exact Test using CI"
    render 'show_formula'
  end
  def bn_cg_y_du_n_mg_n
    @formula = "pp - McNemher Exact Test"
    render 'show_formula'
  end

  def bn_cg_n
    @ask = 'Testing against a benchmark?'
    @ask_help = ''
    @answer_y = 'bn_cg_n_ab_y'
    @answer_n = 'bn_cg_n_ab_n'
    render 'bn'
  end
  def bn_cg_n_ab_y
    @formula = "Pb - 1-Sample Binomial"
    render 'show_formula'
  end
  def bn_cg_n_ab_n
    @formula = "Pb - Adj. Wald CI"
    render 'show_formula'
  end

end
