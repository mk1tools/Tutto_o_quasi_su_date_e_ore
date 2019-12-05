      ****************************************************************
      * ESEMPIO ESTRAZIONE PORZIONE DI DATE
      ****************************************************************

      * www.markonetools.it (c) 2019

       ctl-opt copyright('MarkOneTools')
               indent(' ')
               option(*nodebugio: *srcstmt)
               dftactgrp(*no);

       dcl-s DataOrdine date inz(d'2019-10-01');
       dcl-s AnnoOrdine packed(4);
       dcl-s MeseOrdine packed(2);

       dcl-s msg char(52);

       // estrazione anno
       AnnoOrdine = %subdt(DataOrdine : *y);
       msg = 'Estrazione anno da ' + %char(DataOrdine:*iso) +
             ': ' + %char(AnnoOrdine);
       dsply msg;

       // estrazione mese
       MeseOrdine = %subdt(DataOrdine : *m);
       msg = 'Estrazione mese da ' + %char(DataOrdine:*iso) +
             ': ' + %char(MeseOrdine);
       dsply msg;

       *inlr = *on; 