      **************************************************
      * ESEMPIO CONVERSIONE CAMPO DATA IN ALFANUMERICO *
      **************************************************

      * www.markonetools.it (c) 2019
        
       ctl-opt copyright('MarkOneTools')
               indent(' ')
               option(*nodebugio: *srcstmt)
               dftactgrp(*no);

       dcl-s DataAlfa char(10);
       dcl-s MiaData date inz(d'2019-08-29');

       dcl-s msg char(52);

         DataAlfa = %char(MiaData: *ISO0);  // 20190829
         msg = 'Orig.: 2019-08-29 cvt in ' + %trim(DataAlfa) +
               ' con %char';
         dsply msg;

         *inlr = *on; 