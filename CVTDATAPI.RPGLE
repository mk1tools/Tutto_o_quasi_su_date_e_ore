      *********************************
      * ESEMPIO UTILIZZO API QWCCVTDT *
      *********************************

      * www.markonetools.it (c) 2019

       ctl-opt copyright('MarkOneTools')
               indent(' ')
               option(*nodebugio: *srcstmt)
               dftactgrp(*no);

       //--- MAIN INTERFACE ---
       dcl-pr CVTDATAPI extpgm('CVTDATAPI');
        *n char(16);
        *n char(10);
        *n char(10);
       end-pr;
       dcl-pi CVTDATAPI;
        pmDataI char(16);
        pmFmtI char(10);
        pmFmtO char(10);
       end-pi;

       // data output
       dcl-s pmDataO char(20);

       // prototipo API QWCCVTDT
       dcl-pr QWCCVTDT extpgm;
         *n char(10);
         *n char(16);
         *n char(10);
         *n char(20);
         *n char(256);
       end-pr;

       // DS struttura di errore per API
       dcl-ds API_Error inz;
         // size of the error structure
         //   0: exception returned to the caller
         //   8-11: the message ID is returned and no exception is signaled
         //   >=12: the message ID and msgdta is returned
         //         and no exception is signaled
         errDSLen int(10) inz(%size(API_Error));
         // bytes returned by the API
         errDSRtnLen int(10) inz(*zeros);
         // message ID
         errDSMsgID char(7);
         // riservato
         errReserved char(1) inz(x'00');
         // variable portion of the message text (MSGDTA)
         errMsgData char(240);
       end-ds;

       dcl-s Msg char(52);

        if pmFmtI = *blanks;
          pmFmtI = '*CURRENT';
        endif;

        if pmFmtO = *blanks;
          pmFmtO = '*YYMD';
        endif;

        callp QWCCVTDT(pmFmtI:pmDataI:pmFmtO:pmDataO:API_Error);

        if errDSMsgID <> *blanks;
          msg = 'Errore conversione: ' + %trim(errDSMsgID) +
                ' - ' + %trim(errMsgData);
        else;
          msg = 'Conversione da: ' + %trim(pmDataI) + ' a: ' + %trim(pmDataO);
        endif;
        dsply msg;

        *inlr = *on; 