class ChiSquareController < ApplicationController

  def index
    @result = 0
    @g_a_conversion = 0
    @g_b_conversion = 0
    @conf_int = 0

    @mmm = params[:number_group_a_v].to_i #total design a

  end

  def calculate

    m = params[:number_group_a_v].to_i #total design a
    a = params[:number_group_a_g].to_i #pass design a
    n = params[:number_group_b_v].to_i #total design b
    c = params[:number_group_b_g].to_i #pass design b
    b = m.to_f - a.to_f
    d = n.to_f - c.to_f
    r = a.to_f + c.to_f
    s = b.to_f + d.to_f
    mn = m.to_f + n.to_f


    calc_1 = a*d-b*c
    calc_2 = calc_1*calc_1
    calc_3 = calc_2*mn
    calc_4 = m*n*r*s
    calc_5 = calc_3/calc_4
    calc_6 = a.to_f/m.to_f
    calc_7 = c.to_f/n.to_f

    result_chiSq = calc_5.round(4)

    @result = result_chiSq
    @result_b = 100 - calc_5.round(1)

    @result_m = m
    @result_a = a
    @result_n = n
    @result_c = c

    @g_a_conversion = calc_6.round(4)*100
    @g_b_conversion = calc_7.round(4)*100

    #new calcs
    cell_r1 = m #total group A
    cell_A  = a #ok group A
    cell_B  = cell_r1-cell_A
    cell_r2 = n #total group B
    cell_C  = c #ok group B
    cell_D  = cell_r2-cell_C

    cell_c1 = cell_A+cell_C
    cell_c2 = cell_B+cell_D
    t = cell_A+cell_B+cell_C+cell_D

    @cell_A = cell_A
    @cell_B = cell_B
    @cell_C = cell_C
    @cell_D = cell_D

    ex_A = cell_r1*cell_c1/t
    ex_B = cell_r1*cell_c2/t
    ex_C = cell_r2*cell_c1/t
    ex_D = cell_r2*cell_c2/t

    @Ex_A = ex_A
    @Ex_B = ex_B
    @Ex_C = ex_C
    @Ex_D = ex_D

    csq_B = csq(cell_B,ex_B,0).to_f
    csq_A = csq(cell_A,ex_A,0).to_f
    csq_D = csq(cell_D,ex_D,0).to_f
    csq_C = csq(cell_C,ex_C,0).to_f

    @csq_B = csq_B.to_f
    @csq_A = csq_A.to_f
    @csq_D = csq_D.to_f
    @csq_C = csq_C.to_f

    csny = csq_B+csq_A+csq_D+csq_C

    @csny = csny.round(4)

    fmt = function_fmt(csny)

    @fmt = fmt

    @Ln = function_Ln(fmt)

    @test_function = function_ChiSq(result_chiSq,1)


    @conf_int = function_confidence_interval(m,a,n,c)

    render :action => :index

  end

  def csq(o,e,y)
    if (e==0)
      return 0
    end
    x = o.to_f-e.to_f
    x = x.abs
    x = x-y
    if (x<0)
      return 0
    end
    y = x*x/e
    y = y.to_f
    return y
  end

  def function_fmt(x)
    v = 0
    if (x>=0)
      v = v+(x+0.0005)
    else
      v = v+(x-0.0005)
    end
    # return v.substring(0,v.indexOf('.')+4) #original
    return v.round(3)
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
      return function_ChiSq(q,1)
    end
  end

  def function_Ln(x)
    return Math.log(x)
  end
  def function_Exp(x)
    return Math.exp(x)
  end
  def function_xlx(x)
    return x*function_Ln(x+1e-20)
  end
  def function_Abs(x)
    return x.abs
  end
  def function_Sqrt(x)
    return Math.sqrt(x)
  end
  def function_Cos(x)
    return Math.cos(x)
  end
  def function_Pow(x,n)
    return x**n
  end
  def function_fEnt(x)
    return x * function_Ln(x) / function_Ln(2)
  end

  def function_ChiSq(x,n)
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

  def function_confidence_interval(vAt,vAc,vBt,vBc)

    # vAt = total A
    # vAc = conversions A
    # vBt = total B
    # vBc = conversions B

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

    x = vDs.to_f
    x = vDs.round(4)


    return showPercConfLevel(resF.round(3))

  end

  def showPercConfLevel(x)

    case x
    when 0.000..1.640
      return "to much low"
    when 1.650..1.950
      return "90%"
    when 1.960..2.570
      return "95%"
    when 2.580..3.290
      return "99%"
    else
      return "99,9%"
    end

  end


end
