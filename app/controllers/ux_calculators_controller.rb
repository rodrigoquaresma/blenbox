class UxCalculatorsController < ApplicationController

  def index
  end

  def cn
    @breadcrumbs = [
      ['index',t('ux_calculators.asks.type_data'),'continuous']
    ]
    @ask = t('ux_calculators.asks.cn.ask')
    @ask_help = t('ux_calculators.asks.cn.ask_helper')
    @answer_y = 'cn_cd_y'
    @answer_n = 'cn_cd_n'
    render 'cn'
  end
  def cn_cd_y
    @breadcrumbs = [
      ['index','What type of Data?','continuous'],
      ['cn','Comparing data?','yes']
    ]
    @ask = 'Different users in each group?'
    @ask_help = 'Por exemplo, se os usuários que testaram a versão A não testaram a versão B e vice versa, você pode responder "sim", pois cada grupo foi testado com diferentes usuários em comparação com o outro. A resposta é não se os mesmos usuários utilizaram todas as versões em avaliação.'
    @answer_y = 'cn_cd_y_du_y'
    @answer_n = 'cn_cd_y_du_n'
    render 'cn'
  end
  def cn_cd_y_du_y
    @breadcrumbs = [
      ['index','What type of Data?','continuous'],
      ['cn','Comparing data?','yes'],
      ['cn_cd_y','Different users in each group?','yes']
    ]
    @ask = '3 or more groups?'
    @ask_help = 'Considere um grupo de usuários para cada versão de design que for testada. Responda sim se você estiver testando mais que 2 versões.'
    @answer_y = 'cn_cd_y_du_y_mg_y'
    @answer_n = 'cn_cd_y_du_y_mg_n'
    render 'cn'
  end
  def cn_cd_y_du_y_mg_y
    @breadcrumbs = [
      ['index','What type of Data?','continuous'],
      ['cn','Comparing data?','yes'],
      ['cn_cd_y','Different users in each group?','yes'],
      ['cn_cd_y_du_y','3 or more groups?','yes']
    ]
    @formula = "A - ANOVA"
    render 'show_formula'
  end
  def cn_cd_y_du_y_mg_n
    @breadcrumbs = [
      ['index','What type of Data?','continuous'],
      ['cn','Comparing data?','yes'],
      ['cn_cd_y','Different users in each group?','yes'],
      ['cn_cd_y_du_y','3 or more groups?','no']
    ]
    @formula = "2t - 2-sample t"
    render 'show_formula'
  end

  def cn_cd_y_du_n
    @breadcrumbs = [
      ['index','What type of Data?','continuous'],
      ['cn','Comparing data?','yes'],
      ['cn_cd_y','Different users in each group?','no']
    ]
    @ask = '3 or more groups?'
    @ask_help = 'Considere um grupo de usuários para cada versão de design que for testada. Responda sim se você estiver testando mais que 2 versões.'
    @answer_y = 'cn_cd_y_du_n_mg_y'
    @answer_n = 'cn_cd_y_du_n_mg_n'
    render 'cn'
  end
  def cn_cd_y_du_n_mg_y
    @breadcrumbs = [
      ['index','What type of Data?','continuous'],
      ['cn','Comparing data?','yes'],
      ['cn_cd_y','Different users in each group?','no'],
      ['cn_cd_y_du_n','3 or more groups?','yes']
    ]
    @formula = "Arm - Within subjects ANOVA"
    render 'show_formula'
  end
  def cn_cd_y_du_n_mg_n
    @breadcrumbs = [
      ['index','What type of Data?','continuous'],
      ['cn','Comparing data?','yes'],
      ['cn_cd_y','Different users in each group?','no'],
      ['cn_cd_y_du_n','3 or more groups?','no']
    ]
    @formula = "tt - paired t"
    render 'show_formula'
  end

  def cn_cd_n
    @breadcrumbs = [
      ['index','What type of Data?','continuous'],
      ['cn','Comparing data?','no']
    ]
    @ask = 'Testing against a benchmark?'
    @ask_help = ''
    @answer_y = 'cn_cd_n_ab_y'
    @answer_n = 'cn_cd_n_ab_n'
    render 'cn'
  end
  def cn_cd_n_ab_y
    @breadcrumbs = [
      ['index','What type of Data?','continuous'],
      ['cn','Comparing data?','no'],
      ['cn_cd_n','Testing against a benchmark?','yes']
    ]
    @ask = 'Task time?'
    @ask_help = ''
    @answer_y = 'cn_cd_n_ab_y_tt_y'
    @answer_n = 'cn_cd_n_ab_y_tt_n'
    render 'cn'
  end
  def cn_cd_n_ab_y_tt_y
    @breadcrumbs = [
      ['index','What type of Data?','continuous'],
      ['cn','Comparing data?','no'],
      ['cn_cd_n','Testing against a benchmark?','yes'],
      ['cn_cd_n_ab_y','Task time?','yes']
    ]
    @formula = "tlog - 1-Sample t (log)"
    render 'show_formula'
  end
  def cn_cd_n_ab_y_tt_n
    @breadcrumbs = [
      ['index','What type of Data?','continuous'],
      ['cn','Comparing data?','no'],
      ['cn_cd_n','Testing against a benchmark?','yes'],
      ['cn_cd_n_ab_n','Task time?','no']
    ]
    @formula = "t - 1-Sample t"
    render 'show_formula'
  end

  def cn_cd_n_ab_n
    @breadcrumbs = [
      ['index','What type of Data?','continuous'],
      ['cn','Comparing data?','no'],
      ['cn_cd_n','Testing against a benchmark?','no']
    ]
    @ask = 'Task time?'
    @ask_help = ''
    @answer_y = 'cn_cd_n_ab_n_tt_y'
    @answer_n = 'cn_cd_n_ab_n_tt_n'
    render 'cn'
  end
  def cn_cd_n_ab_n_tt_y
    @breadcrumbs = [
      ['index','What type of Data?','continuous'],
      ['cn','Comparing data?','no'],
      ['cn_cd_n','Testing against a benchmark?','no'],
      ['cn_cd_n_ab_n','Task time?','yes']
    ]
    @formula = "tlog - t (LOG) conf. interval"
    render 'show_formula'
  end
  def cn_cd_n_ab_n_tt_n
    @breadcrumbs = [
      ['index','What type of Data?','continuous'],
      ['cn','Comparing data?','no'],
      ['cn_cd_n','Testing against a benchmark?','no'],
      ['cn_cd_n_ab_n','Task time?','no']
    ]
    @formula = "t - t conf. interval"
    render 'show_formula'
  end

  def bn
    @breadcrumbs = [
      ['index','What type of Data?','binary']
    ]
    @ask = 'Comparing groups?'
    @ask_help = ''
    @answer_y = 'bn_cg_y'
    @answer_n = 'bn_cg_n'
    render 'bn'
  end
  def bn_cg_y
    @breadcrumbs = [
      ['index','What type of Data?','binary'],
      ['bn','Comparing groups?','yes']
    ]
    @ask = 'Different users in each group?'
    @ask_help = ''
    @answer_y = 'bn_cg_y_du_y'
    @answer_n = 'bn_cg_y_du_n'
    render 'bn'
  end
  def bn_cg_y_du_y
    @breadcrumbs = [
      ['index','What type of Data?','binary'],
      ['bn','Comparing groups?','yes'],
      ['bn_cg_y','Different users in each group?','yes']
    ]
    @ask = '3 or more groups?'
    @ask_help = 'Considere um grupo de usuários para cada versão de design que for testada. Responda sim se você estiver testando mais que 2 versões.'
    @answer_y = 'bn_cg_y_du_y_mg_y'
    @answer_n = 'bn_cg_y_du_y_mg_n'
    render 'bn'
  end
  def bn_cg_y_du_y_mg_y
    @breadcrumbs = [
      ['index','What type of Data?','binary'],
      ['bn','Comparing groups?','yes'],
      ['bn_cg_y','Different users in each group?','yes'],
      ['bn_cg_y_du_y','3 or more groups?','yes']
    ]
    @ask = 'Large sample?'
    @ask_help = ''
    @answer_y = 'bn_cg_y_du_y_mg_y_ls_y'
    @answer_n = 'bn_cg_y_du_y_mg_y_ls_n'
    render 'bn'
  end
  def bn_cg_y_du_y_mg_y_ls_y
    @breadcrumbs = [
      ['index','What type of Data?','binary'],
      ['bn','Comparing groups?','yes'],
      ['bn_cg_y','Different users in each group?','yes'],
      ['bn_cg_y_du_y','3 or more groups?','yes'],
      ['bn_cg_y_du_y_mg_y','large sample?','yes']
    ]
    @formula = "chi-square"
    render 'show_formula'
  end
  def bn_cg_y_du_y_mg_y_ls_n
    @breadcrumbs = [
      ['index','What type of Data?','binary'],
      ['bn','Comparing groups?','yes'],
      ['bn_cg_y','Different users in each group?','yes'],
      ['bn_cg_y_du_y','3 or more groups?','yes'],
      ['bn_cg_y_du_y_mg_y','large sample?','no']
    ]
    @formula = "2p - N-1 two proportion test on pairs"
    render 'show_formula'
  end
  def bn_cg_y_du_y_mg_n
    @breadcrumbs = [
      ['index','What type of Data?','binary'],
      ['bn','Comparing groups?','yes'],
      ['bn_cg_y','Different users in each group?','yes'],
      ['bn_cg_y_du_y','3 or more groups?','no']
    ]
    @formula = "2p - N-1 two proportion test"
    render 'show_formula'
  end

  def bn_cg_y_du_n
    @breadcrumbs = [
      ['index','What type of Data?','binary'],
      ['bn','Comparing groups?','yes'],
      ['bn_cg_y','Different users in each group?','no']
    ]
    @ask = '3 or more groups?'
    @ask_help = 'Considere um grupo de usuários para cada versão de design que for testada. Responda sim se você estiver testando mais que 2 versões.'
    @answer_y = 'bn_cg_y_du_n_mg_y'
    @answer_n = 'bn_cg_y_du_n_mg_n'
    render 'bn'
  end
  def bn_cg_y_du_n_mg_y
    @breadcrumbs = [
      ['index','What type of Data?','binary'],
      ['bn','Comparing groups?','yes'],
      ['bn_cg_y','Different users in each group?','no'],
      ['bn_cg_y_du_n','3 or more groups?','yes']
    ]
    @formula = "pp - McNemher Exact Test using CI"
    render 'show_formula'
  end
  def bn_cg_y_du_n_mg_n
    @breadcrumbs = [
      ['index','What type of Data?','binary'],
      ['bn','Comparing groups?','yes'],
      ['bn_cg_y','Different users in each group?','no'],
      ['bn_cg_y_du_n','3 or more groups?','no']
    ]
    @formula = "pp - McNemher Exact Test"
    render 'show_formula'
  end

  def bn_cg_n
    @breadcrumbs = [
      ['index','What type of Data?','binary'],
      ['bn','Comparing groups?','no']
    ]
    @ask = 'Testing against a benchmark?'
    @ask_help = ''
    @answer_y = 'bn_cg_n_ab_y'
    @answer_n = 'bn_cg_n_ab_n'
    render 'bn'
  end
  def bn_cg_n_ab_y
    @breadcrumbs = [
      ['index','What type of Data?','binary'],
      ['bn','Comparing groups?','no'],
      ['bn_cg_n','Testing against a benchmark?','yes']
    ]
    @formula = "Pb - 1-Sample Binomial"
    render 'show_formula'
  end
  def bn_cg_n_ab_n
    @breadcrumbs = [
      ['index','What type of Data?','binary'],
      ['bn','Comparing groups?','no'],
      ['bn_cg_n','Testing against a benchmark?','no']
    ]
    @formula = "Pb - Adj. Wald CI"
    render 'show_formula'
  end

end
