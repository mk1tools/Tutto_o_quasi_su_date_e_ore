      ************************************************
      * ESEMPIO COMPARAZIONE DATE IN FORMATI DIVERSI *
      ************************************************

      * www.markonetools.it (c) 2019
       
       ctl-opt copyright('MarkOneTools')
               indent(' ')
               option(*nodebugio: *srcstmt)
               dftactgrp(*no);

       dcl-s ISO_date date(*ISO);
       dcl-s MDY_date date(*MDY);

         ISO_date = d'2015-10-22';
         MDY_date = d'2015-10-22';
         // perché la costante per valorizzare la variabile MDY_date
         // è scritta in formato *ISO pur essendo la variabile in formato *MDY?
         // se non sapete la risposta cfr. par. "Specifiche definizione variabili (D)"

         if (ISO_date = MDY_date);
           dsply (%char(ISO_date : *iso-) + ' = ' + %char(MDY_date : *usa/));
         endif;

         *inlr = *on;