      **********************************************
      * ESEMPIO CONTROLLO VALIDITA' CAMPI DATA/ORA *
      **********************************************

      * www.markonetools.it (c) 2019

       ctl-opt copyright('MarkOneTools')
               indent(' ')
               option(*nodebugio: *srcstmt)
               dftactgrp(*no);

       dcl-pr TESTDAT3 extpgm('TESTDAT3');
        *n char(10);
       end-pr;
       dcl-pi TESTDAT3;
        DataAlfa char(10);
       end-pi;

       dcl-s YMD_date date;
       dcl-s msg char(52);

         monitor;
           YMD_date = %date(DataAlfa : *iso);
           msg = 'La data ' + %trim(DataAlfa) + ' è valida in formato *ISO';
           dsply msg;
         on-error 112 : 113 : 114;
             msg = 'La data ' + %trim(DataAlfa) + ' è errata. Errore: ' +
                     %char(%status);
             dsply msg;
         endmon;

         *inlr = *on; 