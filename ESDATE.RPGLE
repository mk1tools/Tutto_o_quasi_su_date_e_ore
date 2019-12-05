      *********************************************
      * ESEMPIO UTILIZZO CAMPI DATA/ORA/TIMESTAMP *
      *********************************************

      * www.markonetools.it (c) 2019

       ctl-opt copyright('MarkOneTools')
               indent(' ')
               option(*nodebugio: *srcstmt)
               datedit(*dmy)
               dftactgrp(*no);

       dcl-f ESDATEV workstn;

       dcl-pr system int(10) extproc('system');
        *n pointer value options(*string);
       end-pr;
       dcl-s cmd varchar(500);
       dcl-s CPFMsgID char(7) import('_EXCP_MSGID');

       dcl-s ForEverTrue ind inz(*on);

       // imposta data del job al 1 gennaio 2019
       cmd = 'CHGJOB DATE(010119)';
       callp(e) system(cmd);

       WSDAT1 = 030819;
       WSDAT3 = WSDAT1;
       WSDAT2 = 03082019;
       WSDAT4 = WSDAT2;

       dow ForEverTrue;

         exfmt FMT01;

         select;
           // F3=Fine
           when *INKC;
             leave;
           other;
         endsl;

       enddo;

       *inlr = *on; 