      ****************************************************************
      * ESEMPIO SOMMA O SOTTRAZIONE DURATE
      ****************************************************************

      * www.markonetools.it (c) 2019

       ctl-opt copyright('MarkOneTools')
               indent(' ')
               option(*nodebugio: *srcstmt)
               dftactgrp(*no);

       dcl-s MiaData date;
       dcl-s MiaOra time;
       dcl-s ResData date;
       dcl-s ResOra time;

     c     MiaData       adddur    7:*DAYS       ResData
     c     MiaOra        adddur    8:*HOURS      ResOra

         *inlr = *on; 