      *********************************
      * ESEMPIO UTILIZZO API CEEUTCO  *
      *********************************

      * www.markonetools.it (c) 2019

       ctl-opt copyright('MarkOneTools')
               indent(' ')
               option(*nodebugio: *srcstmt)
               dftactgrp(*no);

       // prototipo API CEEUTCO
       dcl-pr CEEUTCO opdesc;
         *n int(10);
         *n int(10);
         *n float(8);
       end-pr;

       dcl-s OS_Ore int(10);
       dcl-s OS_Minuti int(10);
       dcl-s OS_Secondi float(8);

       dcl-s Msg char(52);

        callp CEEUTCO(OS_Ore:OS_Minuti:OS_Secondi);

        msg = 'Differenza rispetto a UTC:';
        dsply msg;
        msg = ' - ore: ' + %char(OS_Ore) + ' e minuti: ' + %char(OS_Minuti);
        dsply msg;
        msg = ' - secondi: ' + %char(OS_Secondi);
        dsply msg;

        *inlr = *on;