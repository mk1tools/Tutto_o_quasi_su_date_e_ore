      ***********************************************
      * ESEMPIO CONVERSIONE DATA DA DIVERSI FORMATI *
      ***********************************************

      * www.markonetools.it (c) 2019
       
       ctl-opt copyright('MarkOneTools')
               indent(' ')
               option(*nodebugio: *srcstmt)
               dftactgrp(*no);

       dcl-s A_USA char(8);
       dcl-s A_YMD char(8);
       dcl-s A_ISO1 char(8);
       dcl-s A_ISO2 char(10);
       dcl-s A_CYMD char(9);

       dcl-s USA_date date(*usa) inz(d'2019-10-20');
       dcl-s ISO_date date(*iso) inz(d'2019-10-20');
       dcl-s EUR_date date(*eur) inz(d'2019-10-20');
       dcl-s JIS_date date(*jis) inz(d'2019-10-20');
       dcl-s YMD_date date(*ymd) inz(d'2019-10-20');
       dcl-s DMY_date date(*dmy) inz(d'2019-10-20');
       dcl-s MDY_date date(*mdy) inz(d'2019-10-20');
       dcl-s JUL_date date(*jul) inz(d'2019-10-20');
       dcl-s DFT_date date;

       dcl-s curdate date inz(*sys);
       dcl-s curtime time inz(*sys);

       dcl-s msg char(52);

         msg = 'Data: 20 ottobre 2019';
         dsply msg;

         A_USA = %char(JIS_date:*usa0);
         msg = 'Conversione da JIS a USA0:' + A_USA;
         dsply msg;
         A_YMD = %char(USA_date:*ymd0);
         msg = 'Conversione da USA a YMD0:' + A_YMD;
         dsply msg;
         A_ISO1 = %char(MDY_date:*iso0);
         msg = 'Conversione da MDY a ISO0:' + A_ISO1;
         dsply msg;
         A_ISO2 = %char(JIS_date:*cymd-);
         msg = 'Conversione da JIS a CYMD-:' + A_ISO2;
         dsply msg;
         A_CYMD = %char(YMD_date:*cymd);
         msg = 'Conversione da YMD a CYMD:' + A_CYMD;
         dsply msg;

         msg = 'Ora corrente: ' + %char(curtime) +
               ' data corrente ' + %char(curdate);
         dsply msg;

         *inlr = *on; 