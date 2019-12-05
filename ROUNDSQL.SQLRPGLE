      ****************************************************************
      * ESEMPIO ARROTONDAMENTO CON FUNZIONE SQL
      ****************************************************************

      * www.markonetools.it (c) 2019

       ctl-opt copyright('MarkOneTools')
               indent(' ')
               option(*nodebugio: *srcstmt)
               dftactgrp(*no);

       dcl-s Time1 timestamp inz(*sys);
       dcl-s TimeR timestamp;

       dcl-s msg char(52);

         exec sql
           set :TimeR = round_timestamp(:Time1, 'DD');

       msg = 'Ora ' + %char(Time1);
       dsply msg;
       msg =  'arrotondata al giorno: ' + %char(TimeR);
       dsply msg;

         exec sql
           set :TimeR = round_timestamp(:Time1, 'MI');

       msg = 'Ora ' + %char(Time1);
       dsply msg;
       msg =  'arrotondata al minuto: ' + %char(TimeR);
       dsply msg;

       *inlr = *on; 