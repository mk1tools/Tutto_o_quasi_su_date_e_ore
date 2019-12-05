      *****************************************************
      * ESEMPIO ESTRAZIONE PORZIONE DI DATA CON PUNTATORE *
      *****************************************************

      * www.markonetools.it (c) 2019

       ctl-opt copyright('MarkOneTools')
               indent(' ')
               option(*nodebugio: *srcstmt)
               dftactgrp(*no)
               datfmt(*JUL);

       dcl-s JulDate date(*JUL) inz(d'19/177');
       dcl-ds JulDS based(Julptr);
         Jul_yy zoned(2);
         Jul_sep char(1);
         Jul_ddd zoned(3);
       end-ds;
       dcl-s JulDay zoned(3);

       dcl-s msg char(52);

       JulPtr = %addr(JulDate);
       JulDay = Jul_ddd;

       msg = 'Estrazione giorno da ' + %char(JulDate:*jul) +
             ': ' + %char(JulDay);
       dsply msg;

       *inlr = *on; 