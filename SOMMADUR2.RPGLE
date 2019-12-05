      ************************************************************
      * ESEMPIO SOMMA O SOTTRAZIONE DURATE: risultati imprevisti *
      ************************************************************

      * www.markonetools.it (c) 2019

       ctl-opt copyright('MarkOneTools')
               indent(' ')
               option(*nodebugio: *srcstmt)
               dftactgrp(*no)
               datfmt(*DMY/);

       dcl-s MiaData1 date;
       dcl-s MiaData2 date;
       dcl-s MiaData3 date;
       dcl-s MiaData4 date;

       dcl-s msg char(52);

     c     d'28/02/02'   ADDDUR    30:*DAYS      MiaData1
      * risultato MiaData1 = 30/03/02
       msg = '28/02/02 + 30 gg ==> ' + %char(MiaData1:*dmy/);
       dsply msg;

     c     d'28/02/02'   ADDDUR    1:*MONTHS     MiaData2
      * risultato MiaData2 = 28/03/02
       msg = '28/02/02 + 1 m ==> ' + %char(MiaData2:*dmy/);
       dsply msg;

     c     MiaData1      ADDDUR    30:*DAYS      MiaData3
      * risultato MiaData3 = 29/04/02
       msg = %char(MiaData1:*dmy/) + ' + 30 gg ==> ' + %char(MiaData3:*dmy/);
       dsply msg;

     c     MiaData2      ADDDUR    1:*MONTHS     MiaData4
      * risultato MiaData4 = 28/04/02
       msg = %char(MiaData2:*dmy/) + ' + 1 m ==> ' + %char(MiaData4:*dmy/);
       dsply msg;

         *inlr = *on; 