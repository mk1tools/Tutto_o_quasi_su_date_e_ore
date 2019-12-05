      **************************************************
      * ESEMPIO CONVERSIONE CAMPO DATA IN ALFANUMERICO *
      **************************************************

      * www.markonetools.it (c) 2019
       
       ctl-opt copyright('MarkOneTools')
               indent(' ')
               option(*nodebugio: *srcstmt)
               dftactgrp(*no);

       dcl-s yyyymmdd packed(8);
       dcl-s ddmmyy packed(6);
       dcl-s MiaData date(*USA) inz(d'2019-10-20');

       dcl-s msg char(52);

         yyyymmdd = %dec(MiaData : *iso);
         msg = 'Orig.: 2019-10-20 cvt in ' + %char(yyyymmdd) +
               ' con %dec';
         dsply msg;

         ddmmyy = %dec(MiaData : *dmy);
         msg = 'Orig.: 2019-10-20 cvt in ' + %char(ddmmyy) +
               ' con %dec';
         dsply msg;

         yyyymmdd = %uns(%char(MiaData : *iso0));
         msg = 'Orig.: 2019-10-20 cvt in ' + %char(yyyymmdd) +
               ' con %uns e %char';
         dsply msg;


         *inlr = *on; 