      *********************************************************
      * ESEMPIO CALCOLO NUMERO GIORNO DELLA SETTIMANA CON RPG *
      *********************************************************

      * con primo giorno della settimana Lunedì = 1

      * www.markonetools.it (c) 2019
       
       ctl-opt copyright('MarkOneTools')
               indent(' ')
               option(*nodebugio: *srcstmt)
               dftactgrp(*no);

       dcl-s MiaData date inz(*sys);
       dcl-s GiornoSettimana zoned(1);
       dcl-s DataRif date inz(d'0001-01-01');

       dcl-s Msg char(52);

       GiornoSettimana = %rem(%diff(MiaData : DataRif : *DAYS) : 7) + 1;

       msg = 'Numero giorno della settimana: ' + %char(GiornoSettimana);
       dsply msg;

       *inlr = *on; 