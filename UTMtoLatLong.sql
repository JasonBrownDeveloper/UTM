select 180*(phi1-fact1*(fact2+fact3+fact4))/PI latitude
     , ZoneCM-DLongDec longitude
  from (select DeltaLong*180/PI DLongDec
             , n0*TAN(phi1)/r0 fact1
             , dd0*dd0/2 fact2
             , (5+3*t0+10*Q0-4*Q0*Q0-9*eisq)*power(dd0,4)/24 fact3
             , (61+90*t0+298*Q0+45*t0*t0-252*eisq-3*Q0*Q0)*power(dd0,6)/720 fact4
             , 6*ZoneNum-183 ZoneCM
             , phi1
             , PI
          from (select (lof1-lof2+lof3)/COS(phi1) DeltaLong
                     , a*(1-ec*ec)/power((1-power((ec*SIN(phi1)),2)),(3/2)) r0
                     , dd0
                     , t0
                     , Q0
                     , n0
                     , eisq
                     , phi1
                     , PI
                     , ZoneNum
                  from (select dd0 lof1
                             , (1+2*t0+Q0)*power(dd0,3)/6 lof2
                             , (5-2*Q0+28*t0-3*power(Q0,2)+8*eisq+24*power(t0,2))*power(dd0,5)/120 lof3
                             , dd0
                             , t0
                             , Q0
                             , n0
                             , eisq
                             , phi1
                             , ec
                             , a
                             , PI
                             , ZoneNum
                          from (select (500000-lond)/(n0*k0) dd0
                                     , power(TAN(phi1),2) t0
                                     , eisq*power(COS(phi1),2) Q0
                                     , n0
                                     , eisq
                                     , phi1
                                     , ec
                                     , a
                                     , PI
                                     , ZoneNum
                                  from (select a/power((1-power((ec*SIN(phi1)),2)),(1/2)) n0
                                             , ec*ec/(1-ec*ec) eisq
                                             , phi1
                                             , ec
                                             , a
                                             , PI
                                             , k0
                                             , lond
                                             , ZoneNum
                                          from (select mu+ca*SIN(2*mu)+cb*SIN(4*mu)+cc*SIN(6*mu)+cd*SIN(8*mu) phi1
                                                     , ec
                                                     , a
                                                     , PI
                                                     , k0
                                                     , lond
                                                     , ZoneNum
                                                  from (select 3*ei/2-27*power(ei,3)/32 ca
                                                             , 21*power(ei,2)/16-55*power(ei,4)/32 cb
                                                             , 151*power(ei,3)/96 cc
                                                             , 1097*power(ei,4)/512 cd
                                                             , arc/(a*(1-power(ec,2)/4-3*power(ec,4)/64-5*power(ec,6)/256)) mu
                                                             , ec
                                                             , a
                                                             , PI
                                                             , k0
                                                             , lond
                                                             , ZoneNum
                                                          from (select (1-power((1-ec*ec),(1/2)))/(1+power((1-ec*ec),(1/2))) ei
                                                                     , latd/k0 arc
                                                                     , ec
                                                                     , a
                                                                     , PI
                                                                     , k0
                                                                     , ZoneNum
                                                                     , latd
                                                                     , lond
                                                                  from (select SQRT(1-power((b/a),2)) ec
                                                                             , a
                                                                             , PI
                                                                             , k0
                                                                             , ZoneNum
                                                                             , decode(hemi,'N',North,'S',10000000-North,NULL) latd
                                                                             , East lond
                                                                          from (select 6378137 a --equatorial radius WGS 84
                                                                                     , 6356752.3142 b --polar radius WGS 84
                                                                                     , 3.141592654 PI --15 digits
                                                                                     , 0.9996 k0 --scale factor
                                                                                     , 15 ZoneNum --Zone Change me
                                                                                     , 'N' hemi --Hemisphere Change me
                                                                                     , 2900000 North --Northing Change me
                                                                                     , 781496 East --Easting Change me
                                                                                  from dual
                                                                               )
                                                                       )
                                                               )
                                                       )
                                               )
                                       )
                               )
                       )
               )
       )
     ;
