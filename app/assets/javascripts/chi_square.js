
function Ln(x) { return Math.log(x) }
function Exp(x) { return Math.exp(x)}
function xlx(x) { return x*Ln(x+1e-20) }
function Abs(x) { return Math.abs(x) }
function Sqrt(x) { return Math.sqrt(x) }
function Cos(x) { return Math.cos(x) }
function Pow(x,n) { return Math.pow(x,n) }
function fEnt( x ) { return x * Ln(x) / Ln(2) }

var Pi=3.141592653589793; Pi2=2*Pi; LnPi2 = Ln(Pi2); PiD2=Pi/2
var Cell_A; var Cell_B; var Cell_C; var Cell_D
var Cell_r1; var Cell_r2; var Cell_c1; var Cell_c2; var t
var Ex_A; var Ex_B; var Ex_C; var Ex_D; var Sav_A; var Sav_B; var Sav_C; var Sav_D
var cs; var od; var rr; var kp; var fc; var mcr; var sn; var sp; var pp; var np
var arr; var rrr; var plr; var nlr; var dor; var yj; var nnd
var dp; var nn; var nmi; var cc; var ca; var cp; var yq; var ets

function CalcTots(form) {
  Cell_A = eval(form.Cell_A.value)
  Cell_B = eval(form.Cell_B.value)
  Cell_C = eval(form.Cell_C.value)
  Cell_D = eval(form.Cell_D.value)
  Cell_r1 = Cell_A+Cell_B
  Cell_r2 = Cell_C+Cell_D
  Cell_c1 = Cell_A+Cell_C
  Cell_c2 = Cell_B+Cell_D
  t = Cell_A+Cell_B+Cell_C+Cell_D
  form.Cell_r1.value = ''+(Cell_r1)
  form.Cell_r2.value = ''+(Cell_r2)
  form.Cell_c1.value = ''+(Cell_c1)
  form.Cell_c2.value = ''+(Cell_c2)
  form.t.value = ''+(t)
}

function CalcStats(form) {
  var LoSlop = Cell_A;
  if(Cell_D<Cell_A) { LoSlop = Cell_D }
  var HiSlop = Cell_B;
  if(Cell_C<Cell_B) { HiSlop = Cell_C }
  
  var LnProb1 = LnFact(Cell_r1) + LnFact(Cell_r2) + LnFact(Cell_c1) + LnFact(Cell_c2) - LnFact(t)
  var SingleP = Exp( LnProb1 - LnFact(Cell_A) - LnFact(Cell_B) - LnFact(Cell_C) - LnFact(Cell_D) )
  var FisherP=0;
  var LeftP=0;
  var RightP=0;
  var RosnerP=0;
  var SumCheck=0
  var k = Cell_A - LoSlop

  while( k<=Cell_A+HiSlop ) {
    var P = Exp( LnProb1 - LnFact(k) - LnFact(Cell_r1-k) - LnFact(Cell_c1-k) - LnFact(k+Cell_r2-Cell_c1) )
    SumCheck = SumCheck + P
    if( k<=Cell_A ) { LeftP = LeftP + P }
    if( k>=Cell_A ) { RightP = RightP + P }
    if( P<=(SingleP+1e-12) ) { FisherP = FisherP + P }
    k = k + 1
  }

  form.LeftP.value = Fmt(LeftP)
  form.RightP.value = Fmt(RightP)
  form.FisherP.value = Fmt(FisherP)
  form.SingleP.value = Fmt(SingleP)
  form.SumCheck.value = "" + SumCheck
  RosnerP = 0.5
  if( LeftP<RosnerP ) { RosnerP = LeftP }
  if( RightP<RosnerP ) { RosnerP = RightP }
  RosnerP = 2*RosnerP
  form.RosnerP.value = Fmt(RosnerP)

  Ex_A = Cell_r1*Cell_c1/t;
  Sav_A = Ex_A
  Ex_B = Cell_r1*Cell_c2/t;
  Sav_B = Ex_B
  Ex_C = Cell_r2*Cell_c1/t;
  Sav_C = Ex_C
  Ex_D = Cell_r2*Cell_c2/t;
  Sav_D = Ex_D

  cs=csq(Cell_A,Ex_A,.5)+csq(Cell_B,Ex_B,.5)+csq(Cell_C,Ex_C,.5)+csq(Cell_D,Ex_D,.5)

  form.csyc.value = Fmt(cs)
  form.csyc_p.value = Fmt(Csp(cs))


  od=(Cell_A/Cell_B)/(Cell_C/Cell_D);
  form.od.value=Fmt(od)
  rr=(Cell_A/Cell_r1)/(Cell_C/Cell_r2);
  form.rr.value=Fmt(rr)
  kp=2*(Cell_A*Cell_D-Cell_B*Cell_C)/((Cell_B+Cell_A)*(Cell_B+Cell_D)+(Cell_A+Cell_C)*(Cell_D+Cell_C));
  form.kp.value=Fmt(kp)
  fc=(Cell_A+Cell_D)/t;
  form.fc.value=Fmt(fc);
  form.mcr.value=Fmt(1-fc)
  sn=Cell_A/Cell_c1;
  form.sn.value=Fmt(sn)
  sp=Cell_D/Cell_c2;
  form.sp.value=Fmt(sp)
  pp=Cell_A/Cell_r1;
  form.pp.value=Fmt(pp)
  np=Cell_D/Cell_r2;
  form.np.value=Fmt(np)
  plr=sn/(1-sp);
  form.plr.value=Fmt(plr)
  nlr=(1-sn)/sp;
  form.nlr.value=Fmt(nlr)
  dor=(sn/(1-sn))/((1-sp)/sp);
  form.dor.value=Fmt(dor)
  eor=(sn/(1-sn))/(sp/(1-sp));
  form.eor.value=Fmt(eor)
  yj=sn+sp-1;
  form.yj.value=Fmt(yj)
  nnd=1/yj;
  form.nnd.value=Fmt(nnd)
  nnm=1/(1-fc);
  form.nnm.value=Fmt(nnm)
  dp=Cell_A/Cell_r1-Cell_C/Cell_r2;
  form.dp.value=Fmt(dp)
  arr=-dp;
  form.arr.value=Fmt(arr)
  rrr=arr/(Cell_C/Cell_r2);
  form.rrr.value=Fmt(rrr)
  nmi = 1 - ( xlx(Cell_B+Cell_A) + xlx(Cell_D+Cell_C) - xlx(Cell_B) - xlx(Cell_A) - xlx(Cell_D) - xlx(Cell_C) ) / ( xlx(t) - xlx(Cell_c2) - xlx(Cell_c1) );
  form.nmi.value=Fmt(nmi)

  csny=
  csq(Cell_B,Ex_B,0)+
  csq(Cell_A,Ex_A,0)+
  csq(Cell_D,Ex_D,0)+
  csq(Cell_C,Ex_C,0)

  form.csny.value = Fmt(csny)

  form.csny_p.value = Fmt(Csp(csny))

  csmh=(t-1)*(Cell_A*Cell_D-Cell_B*Cell_C)*(Cell_A*Cell_D-Cell_B*Cell_C)/(Cell_r1*Cell_r2*Cell_c1*Cell_c2)
  form.csmh.value = Fmt(csmh)
  form.csmh_p.value = Fmt(Csp(csmh))
  cc=Sqrt(csny/(csny+t));
  form.cc.value=Fmt(cc)
  ca=cc*Sqrt(2);
  form.ca.value=Fmt(ca)
  rtet=Cos(Pi/(1+Sqrt(od)));
  form.rtet.value = Fmt(rtet)

  cp=(Cell_A*Cell_D-Cell_B*Cell_C)/Sqrt(Cell_r1*Cell_r2*Cell_c2*Cell_c1);
  form.cp.value=Fmt(cp)

  yq=(Cell_A*Cell_D-Cell_B*Cell_C)/(Cell_B*Cell_C+Cell_A*Cell_D); form.yq.value=Fmt(yq)
  ets = (Cell_A - Sav_A) / (Cell_A + Cell_B + Cell_C - Sav_A); form.ets.value=Fmt(ets)

  EntR = - ( fEnt(Cell_r1/t) + fEnt(Cell_r2/t) ); form.EntR.value=Fmt(EntR)
  EntC = - ( fEnt(Cell_c1/t) + fEnt(Cell_c2/t) ); form.EntC.value=Fmt(EntC)
  EntRC = - ( fEnt(Cell_A/t) + fEnt(Cell_B/t) + fEnt(Cell_C/t) + fEnt(Cell_D/t) ); form.EntRC.value=Fmt(EntRC)
  EntIB = EntR + EntC - EntRC; form.EntIB.value=Fmt(EntIB)
  EntIA = EntRC - EntR; form.EntIA.value=Fmt(EntIA)
  EntIC = EntRC - EntC; form.EntIC.value=Fmt(EntIC)
  EntSim = EntIB / ( EntIA + EntIB + EntIC ); form.EntSim.value=Fmt(EntSim)
  EntDif = 1 - EntSim; form.EntDif.value=Fmt(EntDif)

  var pcrit = (100-form.ConfLevel.value)/100

  form.Conf_Int_Caption.value = form.ConfLevel.value+"% Conf. Interval"

  var del=LoSlop

  Ex_B=Cell_B+LoSlop;
  Ex_A=Cell_A-LoSlop;
  Ex_D=Cell_D-LoSlop;
  Ex_C=Cell_C+LoSlop;

  var pval=0

  while(del>0.000001) {
    del=del/2
    if(pval<pcrit) { Ex_B=Ex_B-del } else { Ex_B=Ex_B+del }
    Ex_A=Cell_r1-Ex_B; Ex_D=Cell_c2-Ex_B; Ex_C=Cell_r2-Ex_D
    pval=Csp(csq(Cell_B,Ex_B,0.5)+csq(Cell_A,Ex_A,0.5)+csq(Cell_D,Ex_D,0.5)+csq(Cell_C,Ex_C,0.5))
  }

  form.Low_A.value=Fmt(Ex_A); form.Low_B.value=Fmt(Ex_B); form.Low_C.value=Fmt(Ex_C); form.Low_D.value=Fmt(Ex_D); od=(Ex_A/Ex_B)/(Ex_C/Ex_D); form.od_lo.value=Fmt(od)
  rr=(Ex_A/Cell_r1)/(Ex_C/Cell_r2); form.rr_lo.value=Fmt(rr)
  kp=2*(Ex_A*Ex_D-Ex_B*Ex_C)/((Ex_B+Ex_A)*(Ex_B+Ex_D)+(Ex_A+Ex_C)*(Ex_D+Ex_C)); form.kp_lo.value=Fmt(kp)
  fc=(Ex_A+Ex_D)/(Ex_B+Ex_A+Ex_D+Ex_C); form.fc_lo.value=Fmt(fc); form.mcr_hi.value=Fmt(1-fc)
  sn=Ex_A/Cell_c1; form.sn_lo.value=Fmt(sn)
  sp=Ex_D/Cell_c2; form.sp_lo.value=Fmt(sp)
  plr=sn/(1-sp); form.plr_lo.value=Fmt(plr)
  nlr=(1-sn)/sp; form.nlr_hi.value=Fmt(nlr)
  dor=(sn/(1-sn))/((1-sp)/sp); form.dor_lo.value=Fmt(dor)
  eor=(sn/(1-sn))/(sp/(1-sp)); form.eor_lo.value=Fmt(eor)
  yj=sn+sp-1; form.yj_lo.value=Fmt(yj)
  nnd=1/yj; form.nnd_hi.value=Fmt(nnd)
  nnm=1/(1-fc); form.nnm_lo.value=Fmt(nnm)
  pp=Ex_A/Cell_r1; form.pp_lo.value=Fmt(pp)
  np=Ex_D/Cell_r2; form.np_lo.value=Fmt(np)
  dplo=Ex_A/Cell_r1-Ex_C/Cell_r2; form.dp_lo.value=Fmt(dplo)
  arr=-dplo; form.arr_hi.value=Fmt(arr)
  rrr=arr/(Ex_C/Cell_r2); form.rrr_hi.value=Fmt(rrr)
  nmi = 1 - ( xlx(Ex_B+Ex_A) + xlx(Ex_D+Ex_C) - xlx(Ex_B) - xlx(Ex_A) - xlx(Ex_D) - xlx(Ex_C) ) / ( xlx(t) - xlx(Cell_c2) - xlx(Cell_c1) ); form.nmi_lo.value=Fmt(nmi)
  csny=csq(Ex_B,Sav_B,0)+csq(Ex_A,Sav_A,0)+csq(Ex_D,Sav_D,0)+csq(Ex_C,Sav_C,0)
  cc=Sqrt(csny/(csny+t)); form.cc_lo.value=Fmt(cc)
  ca=cc*Sqrt(2); form.ca_lo.value=Fmt(ca)
  rtet=Cos(Pi/(1+Sqrt(od))); form.rtet_lo.value = Fmt(rtet)
  cp=(Ex_A*Ex_D-Ex_B*Ex_C)/Sqrt(Cell_r1*Cell_r2*Cell_c2*Cell_c1); form.cp_lo.value=Fmt(cp)
  yq=(Ex_A*Ex_D-Ex_B*Ex_C)/(Ex_B*Ex_C+Ex_A*Ex_D); form.yq_lo.value=Fmt(yq)
  ets = (Ex_A - Sav_A) / (Ex_A + Ex_B + Ex_C - Sav_A); form.ets_lo.value=Fmt(ets)
  EntR = - ( fEnt(Cell_r1/t) + fEnt(Cell_r2/t) ); form.EntR_lo.value=Fmt(EntR)
  EntC = - ( fEnt(Cell_c1/t) + fEnt(Cell_c2/t) ); form.EntC_lo.value=Fmt(EntC)
  EntRC = - ( fEnt(Ex_A/t) + fEnt(Ex_B/t) + fEnt(Ex_C/t) + fEnt(Ex_D/t) ); form.EntRC_lo.value=Fmt(EntRC)
  EntIB = EntR + EntC - EntRC; form.EntIB_hi.value=Fmt(EntIB)
  EntIA = EntRC - EntR; form.EntIA_lo.value=Fmt(EntIA)
  EntIC = EntRC - EntC; form.EntIC_lo.value=Fmt(EntIC)
  EntSim = EntIB / ( EntIA + EntIB + EntIC ); form.EntSim_hi.value=Fmt(EntSim)
  EntDif = 1 - EntSim; form.EntDif_lo.value=Fmt(EntDif)
  del=HiSlop
  Ex_B=Cell_B-HiSlop; Ex_A=Cell_A+HiSlop; Ex_D=Cell_D+HiSlop; Ex_C=Cell_C-HiSlop; var pval=0
  while(del>0.000001) {
    del=del/2
    if(pval<pcrit) { Ex_B=Ex_B+del } else { Ex_B=Ex_B-del }
    Ex_A=Cell_r1-Ex_B; Ex_D=Cell_c2-Ex_B; Ex_C=Cell_r2-Ex_D
    pval=Csp(csq(Cell_B,Ex_B,0.5)+csq(Cell_A,Ex_A,0.5)+csq(Cell_D,Ex_D,0.5)+csq(Cell_C,Ex_C,0.5))
  }
  form.High_A.value=Fmt(Ex_A); form.High_B.value=Fmt(Ex_B); form.High_C.value=Fmt(Ex_C); form.High_D.value=Fmt(Ex_D);
  od=(Ex_A/Ex_B)/(Ex_C/Ex_D); form.od_hi.value=Fmt(od)
  rr=(Ex_A/Cell_r1)/(Ex_C/Cell_r2); form.rr_hi.value=Fmt(rr)
  kp=2*(Ex_A*Ex_D-Ex_B*Ex_C)/((Ex_B+Ex_A)*(Ex_B+Ex_D)+(Ex_A+Ex_C)*(Ex_D+Ex_C)); form.kp_hi.value=Fmt(kp)
  fc=(Ex_A+Ex_D)/(Ex_B+Ex_A+Ex_D+Ex_C); form.fc_hi.value=Fmt(fc); form.mcr_lo.value=Fmt(1-fc)
  sn=Ex_A/Cell_c1; form.sn_hi.value=Fmt(sn)
  sp=Ex_D/Cell_c2; form.sp_hi.value=Fmt(sp)
  plr=sn/(1-sp); form.plr_hi.value=Fmt(plr)
  nlr=(1-sn)/sp; form.nlr_lo.value=Fmt(nlr)
  dor=(sn/(1-sn))/((1-sp)/sp); form.dor_hi.value=Fmt(dor)
  eor=(sn/(1-sn))/(sp/(1-sp)); form.eor_hi.value=Fmt(eor)
  yj=sn+sp-1; form.yj_hi.value=Fmt(yj)
  nnd=1/yj; form.nnd_lo.value=Fmt(nnd)
  nnm=1/(1-fc); form.nnm_hi.value=Fmt(nnm)
  pp=Ex_A/Cell_r1; form.pp_hi.value=Fmt(pp)
  np=Ex_D/Cell_r2; form.np_hi.value=Fmt(np)
  dphi=Ex_A/Cell_r1-Ex_C/Cell_r2; form.dp_hi.value=Fmt(dphi)
  arr=-dphi; form.arr_lo.value=Fmt(arr)
  rrr=arr/(Ex_C/Cell_r2); form.rrr_lo.value=Fmt(rrr)
  nmi = 1 - ( xlx(Ex_B+Ex_A) + xlx(Ex_D+Ex_C) - xlx(Ex_B) - xlx(Ex_A) - xlx(Ex_D) - xlx(Ex_C) ) / ( xlx(t) - xlx(Cell_c2) - xlx(Cell_c1) ); form.nmi_hi.value=Fmt(nmi)

  csny=csq(Ex_B,Sav_B,0)+csq(Ex_A,Sav_A,0)+csq(Ex_D,Sav_D,0)+csq(Ex_C,Sav_C,0)

  cc=Sqrt(csny/(csny+t)); form.cc_hi.value=Fmt(cc)
  ca=cc*Sqrt(2); form.ca_hi.value=Fmt(ca)
  rtet=Cos(Pi/(1+Sqrt(od))); form.rtet_hi.value = Fmt(rtet)
  cp=(Ex_A*Ex_D-Ex_B*Ex_C)/Sqrt(Cell_r1*Cell_r2*Cell_c2*Cell_c1); form.cp_hi.value=Fmt(cp)
  yq=(Ex_A*Ex_D-Ex_B*Ex_C)/(Ex_B*Ex_C+Ex_A*Ex_D); form.yq_hi.value=Fmt(yq)
  ets = (Ex_A - Sav_A) / (Ex_A + Ex_B + Ex_C - Sav_A); form.ets_hi.value=Fmt(ets)
  EntR = - ( fEnt(Cell_r1/t) + fEnt(Cell_r2/t) ); form.EntR_hi.value=Fmt(EntR)
  EntC = - ( fEnt(Cell_c1/t) + fEnt(Cell_c2/t) ); form.EntC_hi.value=Fmt(EntC)
  EntRC = - ( fEnt(Ex_A/t) + fEnt(Ex_B/t) + fEnt(Ex_C/t) + fEnt(Ex_D/t) ); form.EntRC_hi.value=Fmt(EntRC)
  EntIB = EntR + EntC - EntRC; form.EntIB_lo.value=Fmt(EntIB)
  EntIA = EntRC - EntR; form.EntIA_hi.value=Fmt(EntIA)
  EntIC = EntRC - EntC; form.EntIC_hi.value=Fmt(EntIC)
  EntSim = EntIB / ( EntIA + EntIB + EntIC ); form.EntSim_lo.value=Fmt(EntSim)
  EntDif = 1 - EntSim; form.EntDif_hi.value=Fmt(EntDif)
  if(dp==0) { form.nn.value="Infinite" } else { form.nn.value=Fmt(Math.abs(1/dp)) }
  form.nn_lo.value="Unknown"; form.nn_hi.value="Unknown"
  if(dplo<0 & dphi<0) { form.nn_lo.value=Fmt(-1/dplo); form.nn_hi.value=Fmt(-1/dphi) }
  if(dplo<0 & dphi==0) { form.nn_Lo.value=Fmt(-1/dplo); form.nn_hi.value="Infinite" }
  if(dplo<0 & dphi>0) { form.nn_lo.value=Fmt(1/Math.max(Math.abs(dplo),Math.abs(dphi))); form.nn_hi.value="Infinite" }
  if(dplo==0 & dphi>0) { form.nn_lo.value=Fmt(1/dphi); form.nn_hi.value="Infinite" }
  if(dplo>0 & dphi>0) { form.nn_lo.value=Fmt(1/dphi); form.nn_hi.value=Fmt(1/dplo) }
}


function csq(o,e,y) {
  if(e==0) { return 0 }
  var x=Abs(o-e)-y; if(x<0) { return 0 }
  return x*x/e
}
function Csp(x) {
  return ChiSq(x,1)
}
function ChiSq(x,n) {
  if(x>1000 | n>1000) {
    var q=Norm((Pow(x/n,1/3)+2/(9*n)-1)/Sqrt(2/(9*n)))/2;
    if (x>n) {
      return q
    }
    {
      return 1-q
    }
  }
  var p=Exp(-0.5*x);
  if((n%2)==1) {
    p=p*Sqrt(2*x/Pi)
  }
  var k=n;
  while(k>=2) {
    p=p*x/k;
    k=k-2
  }
  var t=p;
  var Cell_B=n;
  while(t>1e-15*p) {
    Cell_B=Cell_B+2;
    t=t*x/Cell_B;
    p=p+t
  }
  return 1-p
}
function Norm(z) { var q=z*z
  if(Abs(z)>7) {return (1-1/q+3/(q*q))*Exp(-q/2)/(Abs(z)*Sqrt(PiD2))} {return ChiSq(q,1) }
}
function Fmt(x) { var v
  if(x>=0) { v=''+(x+0.0005) } else { v=''+(x-0.0005) }
  return v.substring(0,v.indexOf('.')+4)
}

function LnFact(z) {
  if(z<2) {
    return 0
  }
  if(z<17) {
    f=z;
    while(z>2) {
      z=z-1;
      f=f*z
    };
    return Ln(f)
  }
  return (z+0.5)*Ln(z) - z + LnPi2/2 + 1/(12*z) - 1/(360*Pow(z,3)) + 1/(1260*Pow(z,5)) - 1/(1680*Pow(z,7))
}
