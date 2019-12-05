      **********************************************
      * ESEMPIO CONTROLLO VALIDITA' CAMPI DATA/ORA *
      **********************************************

      * www.markonetools.it (c) 2019

       ctl-opt copyright('MarkOneTools')
               indent(' ')
               option(*nodebugio: *srcstmt)
               dftactgrp(*no);

       dcl-pr TESTDAT1 extpgm('TESTDAT1');
        *n char(10);
       end-pr;
       dcl-pi TESTDAT1;
        DataAlfa char(10);
       end-pi;

       dcl-s msg char(52);

         test(de) DataAlfa;
         if %error;
           msg = 'La data ' + %trim(DataAlfa) + ' è errata';
           dsply msg;
         else;
           msg = 'La data ' + %trim(DataAlfa) + ' è valida in formato *ISO';
           dsply msg;
         endif;

         *inlr = *on; 