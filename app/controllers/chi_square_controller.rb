class ChiSquareController < ApplicationController

  def index
  end

  def calculate

    # define vars
    m = params[:number_group_a_v].to_i #total design a
    a = params[:number_group_a_g].to_i #pass design a
    n = params[:number_group_b_v].to_i #total design b
    c = params[:number_group_b_g].to_i #pass design b

    @value_m = m
    @value_a = a
    @value_n = n
    @value_c = c

    # functions

    @function_isSmallSampleSizes = function_isSmallSampleSizes(m,a,n,c)

    # chiSquare / two proportion test
    chiSquare = function_chiSquare(m,a,n,c)
    @chiSquare = chiSquare
    chiSquare_pValue = function_pValue(chiSquare,1)
    @chiSquare_pValue = chiSquare_pValue
    @chiSquare_ConfidenceInterval = function_Norm(chiSquare_pValue)

    # N-1 chiSquare / N-1 two proportion test
    nChiSquare = function_nChiSquare(m,a,n,c)
    @nChiSquare = nChiSquare
    nChiSquare_pValue = function_pValue(nChiSquare,1)
    @nChiSquare_pValue = nChiSquare_pValue
    @nchiSquare_ConfidenceInterval = function_Norm(nChiSquare_pValue)

    # Yates correction
    yatesChiSquare = function_yatesChiSquare(m,a,n,c)
    @yatesChiSquare = yatesChiSquare
    yatesChiSquare_pValue = function_pValue(yatesChiSquare,1)
    @yatesChiSquare_pValue = yatesChiSquare_pValue
    @yatesChiSquare_ConfidenceInterval = function_Norm(yatesChiSquare_pValue)

    # Fisher Exact Test
    fisherExactTest = function_fisherExactTest(m,a,n,c)
    @fisherExactTest = fisherExactTest
    fisherExactTest_pValue = function_pValue(fisherExactTest,1)
    @fisherExactTest_pValue = function_fisherChiSquare(m,a,n,c)
    @fisherExactTest_ConfidenceInterval = function_Norm(fisherExactTest_pValue)

    @function_confidenceInterval = function_confidenceInterval(m,a,n,c)
    @function_conversionRates = function_conversionRates(m,a,n,c)
    csny = function_csny(m,a,n,c)
    @function_csny = csny
    @function_Ln = function_Ln(csny.round(3))

    # @function_cs = function_cs(m,a,n,c)
    # @show_me_the_number = function_pursuit(m,a,n,c)

    if @winner = true
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

  def function_fisherExactTest(vm,va,vn,vc)

    cell_r1 = vm              #total group A
    cell_A  = va              #success group A
    cell_B  = cell_r1-cell_A  #fail group A
    cell_r2 = vn              #total group B
    cell_C  = vc              #success group B
    cell_D  = cell_r2-cell_C  #fail group B

    cell_c1 = cell_A+cell_C   #total success
    cell_c2 = cell_B+cell_D   #total fail
    t = cell_A+cell_B+cell_C+cell_D #total

    loSlop = cell_A
    loSlop = cell_D if (cell_D<cell_A)

    hiSlop = cell_B
    hiSlop = cell_C if (cell_C<cell_B)

    lnProb1 = function_LnFact(cell_r1) + function_LnFact(cell_r2) + function_LnFact(cell_c1) + function_LnFact(cell_c2) - function_LnFact(t)
    singleP = function_Exp( lnProb1 - function_LnFact(cell_A) - function_LnFact(cell_B) - function_LnFact(cell_C) - function_LnFact(cell_D) )
    fisherP=0
    leftP=0
    rightP=0
    # rosnerP=0
    sumCheck=0
    k = cell_A - loSlop

    while( k<=cell_A+hiSlop )
      vP = function_Exp( lnProb1 - function_LnFact(k) - function_LnFact(cell_r1-k) - function_LnFact(cell_c1-k) - function_LnFact(k+cell_r2-cell_c1) )
      sumCheck = sumCheck + vP
      if( k<=cell_A )
        leftP = leftP + vP
      end
      if( k>=cell_A )
        rightP = rightP + vP
      end
      if( vP<=(singleP+1e-12) )
        fisherP = fisherP + vP
      end
      k = k + 1
    end


    @show_me_the_number = rightP,leftP

    return fisherP.to_f

  end


  def function_fisherChiSquare(vm,va,vn,vc)

    # vm = total A
    # va = conversions A
    # vn = total B
    # vc = conversions B
    vb = vm - va
    vd = vn - vc
    vr = va + vc
    vs = vb + vd
    vN = vm + vn

    vFm= function_factorial(vm)
    vFa= function_factorial(va)
    vFn= function_factorial(vn)
    vFc= function_factorial(vc)
    vFb= function_factorial(vb)
    vFd= function_factorial(vd)
    vFr= function_factorial(vr)
    vFs= function_factorial(vs)
    vFN= function_factorial(vN)

    calc_01 = vFm*vFn*vFr*vFs
    calc_02 = vFa*vFb*vFc*vFd*vFN
    calc_03 = calc_01.round(4)/calc_02.round(4)

    x = calc_03.to_f

    return x

  end

  def function_yatesChiSquare(vm,va,vn,vc)

    # vm = total A
    # va = conversions A
    # vn = total B
    # vc = conversions B
    vb = vm.to_f - va.to_f
    vd = vn.to_f - vc.to_f
    vr = va.to_f + vc.to_f
    vs = vb.to_f + vd.to_f
    vN = vm.to_f + vn.to_f

    calc_01 = va*vd-vb*vc
    calc_02 = vN/2
    calc_03 = calc_01-calc_02
    calc_04 = calc_03*calc_03
    calc_05 = calc_04*vN
    calc_06 = vm*vn*vr*vs
    calc_07 = calc_05/calc_06

    x = calc_07.to_f

    return x.round(3)

  end

  def function_csny(vm,va,vn,vc)

    cell_r1 = vm #total group A
    cell_A  = va #ok group A
    cell_B  = cell_r1-cell_A
    cell_r2 = vn #total group B
    cell_C  = vc #ok group B
    cell_D  = cell_r2-cell_C

    cell_c1 = cell_A+cell_C
    cell_c2 = cell_B+cell_D
    t = cell_A+cell_B+cell_C+cell_D

    ex_A = cell_r1*cell_c1/t
    ex_B = cell_r1*cell_c2/t
    ex_C = cell_r2*cell_c1/t
    ex_D = cell_r2*cell_c2/t

    csq_B = function_csq(cell_B,ex_B,0).to_f
    csq_A = function_csq(cell_A,ex_A,0).to_f
    csq_D = function_csq(cell_D,ex_D,0).to_f
    csq_C = function_csq(cell_C,ex_C,0).to_f

    csny = csq_B+csq_A+csq_D+csq_C

    return csny.to_f

  end

  def function_cs(vm,va,vn,vc)

    cell_r1 = vm #total group A
    cell_A  = va #ok group A
    cell_B  = cell_r1-cell_A
    cell_r2 = vn #total group B
    cell_C  = vc #ok group B
    cell_D  = cell_r2-cell_C

    cell_c1 = cell_A+cell_C
    cell_c2 = cell_B+cell_D
    t = cell_A+cell_B+cell_C+cell_D

    ex_A = cell_r1*cell_c1/t
    ex_B = cell_r1*cell_c2/t
    ex_C = cell_r2*cell_c1/t
    ex_D = cell_r2*cell_c2/t

    csq_B = function_csq(cell_B,ex_B.to_f,0.5).to_f
    csq_A = function_csq(cell_A,ex_A.to_f,0.5).to_f
    csq_D = function_csq(cell_D,ex_D.to_f,0.5).to_f
    csq_C = function_csq(cell_C,ex_C.to_f,0.5).to_f

    # cs=function_csq(Cell_A,Ex_A,.5)+function_csq(Cell_B,Ex_B,.5)+function_csq(Cell_C,Ex_C,.5)+function_csq(Cell_D,Ex_D,.5)

    cs = csq_A+csq_B+csq_C+csq_D

    return cs.to_f

  end

  def function_conversionRates(vm,va,vn,vc)

    calc_1 = va.to_f/vm.to_f
    calc_2 = vc.to_f/vn.to_f

    calc_1 = calc_1*100
    calc_2 = calc_2*100
    calc_1 = calc_1.round(2)
    calc_2 = calc_2.round(2)

    @conversion_rate_a = calc_1
    @conversion_rate_b = calc_2

    return calc_1,calc_2

  end

  def function_chiSquare(vm,va,vn,vc)

    vb = vm.to_f - va.to_f
    vd = vn.to_f - vc.to_f
    vr = va.to_f + vc.to_f
    vs = vb.to_f + vd.to_f
    vN = vm.to_f + vn.to_f

    calc_1 = va*vd-vb*vc
    calc_2 = calc_1*calc_1
    calc_3 = calc_2*vN
    calc_4 = vm*vn*vr*vs
    calc_5 = calc_3/calc_4

    return calc_5.to_f.round(4)

  end

  def function_nChiSquare(vm,va,vn,vc)

    vb = vm.to_f - va.to_f
    vd = vn.to_f - vc.to_f
    vr = va.to_f + vc.to_f
    vs = vb.to_f + vd.to_f
    vN = vm.to_f + vn.to_f
    vN1 = vN.to_f - 1

    calc_1 = va*vd-vb*vc
    calc_2 = calc_1*calc_1
    calc_3 = calc_2*vN1
    calc_4 = vm*vn*vr*vs
    calc_5 = calc_3/calc_4

    return calc_5.to_f.round(4)

  end

  def function_csq(o,e,y)
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
    return v.round(4)
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
  def function_factorial(x)
    n = (1..x).inject(:*) || 1
    return n
  end
  def function_LnFact(z)
    varPi=3.141592653589793
    varPi2=2*varPi
    varPiD2=varPi/2
    varLnPi2=function_Ln(varPi2)
    if(z<2)
      return 0
    end
    if(z<17)
      f=z;
      while(z>2)
        z=z-1;
        f=f*z
      end
      return function_Ln(f)
    end
    return (z+0.5)*function_Ln(z) - z + varLnPi2/2 + 1/(12*z) - 1/(360*function_Pow(z,3)) + 1/(1260*function_Pow(z,5)) - 1/(1680*function_Pow(z,7))
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

    @vns = vns.round(4)

    calc_11 = vP.to_f*vQ.to_f
    calc_12 = calc_11.to_f*vns.to_f
    calc_13 = function_Sqrt(calc_12.to_f)

    vDi = calc_13.to_f
    vDi = calc_13.round(4)

    resF = vDs.to_f/vDi.to_f
    resF.round(4)

    form_normdist = (1-resF)*2
    form_normdist = form_normdist.to_f

    @vz = resF.round(3)

    @function_Norm = function_Norm(resF.round(3))

    return showPercConfLevel(resF.round(3))

  end

  def function_isSmallSampleSizes(vm,va,vn,vc)

    # vm = total A
    # va = conversions A
    # vn = total B
    # vc = conversions B

    vr = va+vc
    vs = (vm-va)+(vn-vc)

    vN = vm+vn

    calc_1 = vr*vm
    calc_2 = calc_1.to_f/vN

    calc_3 = vs*vm
    calc_4 = calc_3.to_f/vN

    calc_5 = vr*vn
    calc_6 = calc_5.to_f/vN

    calc_7 = vs*vn
    calc_8 = calc_7.to_f/vN

    if (calc_2.round(1)<5 || calc_4.round(1)<5 || calc_6.round(1)<5 || calc_8.round(1)<5)
      return true
    else
      return false
    end

  end

  def showPercConfLevel(x)

    case x
    when 0.000..1.640
      @message = 'No, there is not a clear winner. Try with a bigger sample.'
      @winner = false
      return "low"
    when 1.650..1.950
      @winner = false
      @message = 'Almost done... the confidence interval is high, but it is not the best. Try with a bigger sample.'
      return "90%"
    when 1.960..2.570
      @winner = true
      @message = 'Hummm, we can say that we have a winner, but... be careful, the confidence interval is not the best.'
      return "95%"
    when 2.580..3.290
      @winner = true
      @message = 'Nice! You have a winner! Go for it!'
      return "99%"
    else
      @winner = true
      @message = 'Great! You have a winner! Go for it! It is the best confidence interval possible!'
      return "99,9%"
    end

  end


end
