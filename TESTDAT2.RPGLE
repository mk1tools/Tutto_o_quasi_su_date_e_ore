      ****************************************************************
      * ESEMPIO CONTROLLO VALIDITA' CAMPI DATA/ORA
      ****************************************************************

      * www.markonetools.it (c) 2019

       ctl-opt copyright('MarkOneTools')
               indent(' ')
               option(*nodebugio: *srcstmt)
               dftactgrp(*no);

       dcl-s A_USA char(8) inz('09201995');
       dcl-s A_YMD char(8) inz('93.01.21');
       dcl-s A_ISO1 char(8) inz('19950920');
       dcl-s A_ISO2 char(10) inz('1950-10-24');
       dcl-s N_CYMD packed(7) inz(1150930);

       dcl-s YMD_date date;
       dcl-s MDY_date date;
       dcl-s ISO_date date;
       dcl-s JIS_date date;
       dcl-s USA_date date;

         test(de) *usa0 A_USA;
         if not %error;
           YMD_date = %date(A_USA : *usa0);
         endif;
  	
         test(de) *ymd. A_YMD;
         if not %error;
           MDY_date = %date(A_YMD : *ymd.);
         endif;
  	
         test(de) *iso0 A_ISO1;
         if not %error;
           ISO_date = %date(A_ISO1 : *iso0);
         endif;
  	
         test(de) *iso A_ISO2;
         if not %error;
           JIS_date = %date(A_ISO2 : *iso);
         endif;

         test(de) *cymd N_CYMD;
         if not %error;
           USA_date = %date(N_CYMD : *cymd);
         endif;

         *inlr = *on; 