class ChiSquareController < ApplicationController

  def index
  end

  def calculate
    m = params[:number_group_a_v].to_i #total group a
    a = params[:number_group_a_g].to_i #pass group a
    n = params[:number_group_b_v].to_i #total group b
    c = params[:number_group_b_g].to_i #pass group b
    @value_m = m
    @value_a = a
    @value_n = n
    @value_c = c
    if isnotzero(m) == false || isnotzero(n) == false
      @message_error = t('ab_testing_calculator.result_calculator.message.error.have_zero')
      render :action => :not_result
    elsif isnotnegative(a) == false || isnotnegative(c) == false
      @message_error = t('ab_testing_calculator.result_calculator.message.error.have_pass_negative')
      render :action => :not_result
    elsif m < a || n < c
      @message_error = t('ab_testing_calculator.result_calculator.message.error.total_minor_pass')
      render :action => :not_result
    else
      function_conversionRates(m,a,n,c)
      calculateZValue(m,a,n,c)
      function_confidenceInterval(m,a,n,c)
      if @winner == true
        if @conversion_rate_a > @conversion_rate_b
          @thewinner_a = true
          @thewinner_b = false
        elsif @conversion_rate_b > @conversion_rate_a
          @thewinner_a = false
          @thewinner_b = true
        end
      end
      render :action => :result
    end
  end

  def isnotzero(x)
    x <= 0 ? false : true
  end

  def isnotnegative(x)
    x < 0 ? false : true
  end

  def function_conversionRates(vm,va,vn,vc)
    calc_1 = va.to_f/vm.to_f
    calc_2 = vc.to_f/vn.to_f
    calc_1 = calc_1*100
    calc_2 = calc_2*100
    calc_1 = calc_1.round(1)
    calc_2 = calc_2.round(1)
    @conversion_rate_a = calc_1
    @conversion_rate_b = calc_2
    return calc_1,calc_2
  end

  def function_Norm(z)
    varPi=3.141592653589793
    varPi2=2*varPi
    varPiD2 = varPi/2
    varLnPi2 = function_Ln(varPi2)
    q=z*z
    if (function_Abs(z)>7)
      return (1-1/q+3/(q*q))*function_Exp(-q/2)/(function_Abs(z)*function_Sqrt(varPiD2))
    else
      return function_pValue(q,1)
    end
  end

  def function_Ln(x)
    return Math.log(x)
  end
  def function_Abs(x)
    return x.abs
  end
  def function_Sqrt(x)
    return Math.sqrt(x)
  end
  def function_Pow(x,n)
    return x**n
  end
  def function_Exp(x)
    return Math.exp(x)
  end

  def function_pValue(x,n)
    varPi=3.141592653589793
    if (x>1000 || n>1000)
      q=function_Norm((function_Pow(x/n,1/3)+2/(9*n)-1)/function_Sqrt(2/(9*n)))/2;
      if (x>n)
        return q
      else
        return 1-q
      end
    end
    p=function_Exp(-0.5*x);
    if ((n%2)==1)
      p=p*function_Sqrt(2*x/varPi)
    end
    k=n;
    while (k>=2) do
      p=p*x/k;
      k=k-2
    end
    t=p;
    cell_B=n;
    while (t>1e-15*p) do
      cell_B=cell_B+2;
      t=t*x/cell_B;
      p=p+t
    end
    res = 1-p
    return res.round(4)
  end

  def function_confidenceInterval(vAt,vAc,vBt,vBc)
    vConvRtA = vAc.to_f/vAt.to_f
    vConvRtA = vConvRtA.round(4)
    vConvRtB = vBc.to_f/vBt.to_f
    vConvRtB = vConvRtB.round(4)
    vN = vAt+vBt
    calc_1 = vAc+vBc
    calc_2 = vAt+vBt
    calc_3 = calc_1.to_f/calc_2.to_f
    vP = calc_3.round(4)
    vQ = 1-calc_3.round(4)
    calc_4 = vN-1
    calc_5 = calc_4.to_f/vN
    calc_6 = function_Sqrt(calc_5.to_f)
    calc_7 = vConvRtB-vConvRtA
    if calc_7 < 0
      calc_7 = calc_7 * -1
    end
    vDs = calc_7.to_f*calc_6.to_f
    vDs = vDs.round(4)
    vn1 = vAt
    vn2 = vBt
    calc_8 = 1/vn1.to_f
    calc_9 = 1/vn2.to_f
    calc_10 = calc_8.to_f+calc_9.to_f
    vns = calc_10.to_f
    calc_11 = vP.to_f*vQ.to_f
    calc_12 = calc_11.to_f*vns.to_f
    calc_13 = function_Sqrt(calc_12.to_f)
    vDi = calc_13.to_f
    vDi = calc_13.round(4)
    resF = vDs.to_f/vDi.to_f
    resF.round(4)
    form_normdist = (1-resF)*2
    form_normdist = form_normdist.to_f
    @function_confidenceInterval = showPercConfLevel(resF.round(3))
  end

  def showPercConfLevel(x)
    case x
    when 0.000..1.640
      @winner = false
      @message = t('ab_testing_calculator.result_calculator.message.confidence_interval_less_90')
      return "low"
    when 1.650..1.950
      @winner = false
      @message = t('ab_testing_calculator.result_calculator.message.confidence_interval_90')
      return "90%"
    when 1.960..2.570
      @winner = true
      @message = t('ab_testing_calculator.result_calculator.message.confidence_interval_95')
      return "95%"
    when 2.580..3.290
      @winner = true
      @message = t('ab_testing_calculator.result_calculator.message.confidence_interval_99')
      return "99%"
    else
      @winner = true
      @message = t('ab_testing_calculator.result_calculator.message.confidence_interval_greater_99')
      return "99.9%"
    end
  end

  def calculateZValue(m,a,n,c)
    vP = (a.to_f+c.to_f)/(m.to_f+n.to_f)
    vQ = 1- vP.to_f
    vp1 = ((a.to_f/m.to_f)*10).to_f
    vp2 = ((c.to_f/n.to_f)*10).to_f
    if vp1.to_f > vp2.to_f
      vz_calc_1 = vp1.to_f - vp2.to_f
    elsif vp1.to_f < vp2.to_f
      vz_calc_1 = vp2.to_f - vp1.to_f
    else
      vz_calc_1 = 0
    end
    vz_calc_2 = ((m.to_f+n.to_f).to_f-1)/(m.to_f+n.to_f).to_f
    vz_calc_2 = function_Sqrt(vz_calc_2.to_f)
    vz_calc_3 = vz_calc_1.to_f * vz_calc_2.to_f
    vz_calc_4 = (1/m.to_f) + (1/n.to_f)
    vz_calc_5 = function_Sqrt(vP.to_f * vQ.to_f * vz_calc_4.to_f)
    vz_calc_6 = vz_calc_3.to_f / vz_calc_5.to_f
    vz_calc_6 = vz_calc_6.to_f/10
    vz_value = vz_calc_6.round(2)
    vp_value = function_Norm(vz_value.to_f).round(2)
    vp_value_probability_same = vp_value*100
    vp_value_probability_diff = 100 - vp_value_probability_same
    @vp_value_probability_same = vp_value_probability_same.round(0)
    @vp_value_probability_diff = vp_value_probability_diff.round(0)
    vPadj_calc_1 = functionCriticalValue(vz_value)
    vPadj_calc_2 = vPadj_calc_1*vPadj_calc_1
    vPadj1 = (a + (vPadj_calc_2/4))/(m + (vPadj_calc_2/2))
    vPadj2 = (c + (vPadj_calc_2/4))/(n + (vPadj_calc_2/2))
    vRange_calc_1 = vPadj1 - vPadj2
    if vRange_calc_1 < 0
      vRange_calc_1 = vRange_calc_1 * - 1
    end
    vRange_calc_2 = (vPadj1*(1-vPadj1))/(m + (vPadj_calc_2/2)) + (vPadj2*(1-vPadj2))/(n + (vPadj_calc_2/2))
    vRange_calc_3 = vPadj_calc_1 * function_Sqrt(vRange_calc_2)
    @expecBot = ((vRange_calc_1 - vRange_calc_3)*100).round(1)
    @expecTop = ((vRange_calc_1 + vRange_calc_3)*100).round(1)
  end

  def functionCriticalValue(x)
    case x
    when 0.000..1.644
      return 0
    when 1.645..1.959
      return 1.645
    when 1.960..2.575
      return 1.960
    when 2.576..3.289
      return 2.576
    else
      return 3.290
    end
  end
end
