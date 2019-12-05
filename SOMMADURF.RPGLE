      ********************************************************
      * ESEMPIO SOMMA O SOTTRAZIONE DURATE in formato libero *
      ********************************************************

      * www.markonetools.it (c) 2019

       ctl-opt copyright('MarkOneTools')
               indent(' ')
               option(*nodebugio: *srcstmt)
               dftactgrp(*no);

       dcl-s MiaData date inz(d'2019-10-20');
       dcl-s ResData date;
       dcl-s MioTimestamp timestamp inz(z'2019-10-20-13.30.00.000');
       dcl-s ResTimestamp timestamp;

       dcl-s msg char(52);

         ResData = MiaData + %years(2) + %months(5) + %days(16);
         msg = %char(MiaData:*iso) + ' + 2 aa 5 mm e 16 gg ==> ' +
               %char(ResData:*iso);
         dsply msg;

         ResTimestamp = MioTimestamp +
                        %hours(10) + %minutes(15) + %seconds(25) + %mseconds(3);
         msg = %char(MioTimestamp) + ' + 10 hh 15 mm 25 sec 3 ms';
         dsply msg;
         msg = '==> ' + %char(ResTimestamp);
         dsply msg;

         *inlr = *on; 