      ****************************************************************
      * ESEMPIO ARROTONDAMENTO AL MINUTO
      ****************************************************************

      * www.markonetools.it (c) 2019

       ctl-opt copyright('MarkOneTools')
               indent(' ')
               option(*nodebugio: *srcstmt)
               dftactgrp(*no);

       dcl-s Time1 time;
       dcl-s Time2 time;
       dcl-s SSeconds packed(2);

       dcl-s msg char(52);

       Time1 = %time();
       Time2 = Time1;
       SSeconds = %subdt(Time2:*seconds);
       Time2 = Time2 - %seconds(SSeconds);
       If SSeconds > 30;
        Time2 = Time2 + %minutes(1);
       Endif;

       msg = 'Ora ' + %char(Time1) +
              ' arrotondata al minuto: ' + %char(Time2);
       dsply msg;

       *inlr = *on; 