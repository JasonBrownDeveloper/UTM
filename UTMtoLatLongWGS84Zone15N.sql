select 180*(phi1-(n0*TAN(phi1)/(6378137*(1-0.0818191909289062*0.0818191909289062)/power((1-power((0.0818191909289062*SIN(phi1)),2)),(3/2))))*((dd0*dd0/2)+((5+3*t0+10*Q0-4*Q0*Q0-9*0.00673949675658688)*power(dd0,4)/24)+((61+90*t0+298*Q0+45*t0*t0-252*0.00673949675658688-3*Q0*Q0)*power(dd0,6)/720)))/3.141592654 latitude
     , -93-(((dd0-((1+2*t0+Q0)*power(dd0,3)/6)+((5-2*Q0+28*t0-3*power(Q0,2)+8*0.00673949675658688+24*power(t0,2))*power(dd0,5)/120))/COS(phi1))*180/3.141592654) longitude
  from (select (500000-lond)/(n0*0.9996) dd0
             , power(TAN(phi1),2) t0
             , 0.00673949675658688*power(COS(phi1),2) Q0
             , n0
             , phi1
          from (select 6378137/power((1-power((0.0818191909289062*SIN(phi1)),2)),(1/2)) n0
                     , phi1
                     , lond
                  from (select mu+0.00251882658972115*SIN(2*mu)+0.00000370094905128477*SIN(4*mu)+0.00000000744781381478833*SIN(6*mu)+0.0000000000170359933828062*SIN(8*mu) phi1
                             , lond
                          from (select (latd/0.9996)/(6378137*(1-power(0.0818191909289062,2)/4-3*power(0.0818191909289062,4)/64-5*power(0.0818191909289062,6)/256)) mu
                                     , lond
                                  from (select 2900000 latd --Northing Change me
                                             , 781496 lond --Easting Change me
                                          from dual
                                       )
                               )
                       )
               )
       )
     ;
