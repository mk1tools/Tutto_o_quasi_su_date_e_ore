      *********************************************
      * ESEMPIO UTILIZZO API CEE CEEDAYS, CEEDATE *
      *  PER CONVERSIONE DI UNA STRINGA IN DATA   *
      *  E CAMBIO DI FORMATO                      *
      *********************************************

      * www.markonetools.it (c) 2019
      * tratto da "Conversione delle dati con le API" di Peter Levy

       ctl-opt copyright('MarkOneTools')
               indent(' ')
               option(*nodebugio: *srcstmt)
               dftactgrp(*no);

       dcl-pi CvAlfa2Dat;
         // data da convertire ricevuta in input
         pmDataAlfa char(32);
         // formato della data in input
         pmFormatoIn char(32);
         // formato della data in output
         pmFormatoOut char(32);
       end-pi;

       // conversione data dal formato alfanumerico al formato liliano
       dcl-pr CEEDAYS extproc('CEEDAYS') opdesc;
         // stringa alfanumerica che rappresenta una data
         *n char(32767) options(*varsize) const;
         // "stringa di immagine" che definisce il formato del primo parametro
         // N.B. la lunghezza deve corrispondere con quella del primo parametro
         *n char(32767) options(*varsize) const;
         // data liliana in output
         *n int(10);
         // token di condizione. Se non viene passato le API
         //  inviano messaggi di escape in caso di errore
         *n char(12) options(*omit);
       end-pr;

       // conversione data dal formato liliano al formato alfanumerico
       dcl-pr CEEDATE extproc('CEEDATE') opdesc;
         // data liliana in input
         *n int(10);
         // stringa di immagine che definisce il formato del terzo parametro
         *n char(32767) options(*varsize) const;
         // stringa alfanumerica in output
         *n char(32767) options(*varsize) const;
         // token di condizione
         *n char(12) options(*omit);
       end-pr;

       // data convertita in formato YYYY-MM-DD
       dcl-s OutDataAlfa char(10);
       // data output come tipo data
       dcl-s OutData date;
       // data output riformattata
       dcl-s OutDataCvt char(10);
       // data in formato liliano
       dcl-s DataLil int(10);

       dcl-s msg char(52);

         // se il formato di output è omesso assumo YYYY-MM-DD
         if pmFormatoOut = *blanks;
           pmFormatoOut = 'YYYY-MM-DD';
         endif;

         // conversione data e stringa immagine dal formato CYY a YYYY
         //  poiché le API CEE non gestiscono il formato data di 7 caratteri il cui primo
         //  byte indica il secolo (p.es. 0=19, 1=20...)
         // per il formato output non serve convertire la data quindi il primo parametro
         //  lo ometto
         if CYYtoYYYY(*omit : pmFormatoOut : %size(pmFormatoOut));
           // errore
           return;
         endif;
         // conversione data e stringa immagine di input
         if CYYtoYYYY(pmDataAlfa : pmFormatoIn : %size(pmFormatoIn));
           // errore
           return;
         endif;

         // converto data input in formato liliano
         monitor;
           CEEDAYS(pmDataAlfa : pmFormatoIn : DataLil : *omit);
         on-error;
           msg = 'CEEDAYS: errore ' + %char(%status);
           dsply msg;
           return;
         endmon;

         // converto dal formato liliano a YYYY-MM-DD per poi ottenere un campo di tipo data
         monitor;
           CEEDATE(DataLil : 'YYYY-MM-DD' : OutDataAlfa : *omit);
         on-error;
           msg = 'CEEDATE to YYYY-MM-DD: errore ' + %char(%status);
           dsply msg;
           return;
         endmon;
         OutData = %date(%trim(OutDataAlfa));
         // converto dal formato liliano al formato di output
         monitor;
           CEEDATE(DataLil : %trim(pmFormatoOut) : OutDataCvt : *omit);
         on-error;
           msg = 'CEEDATE to pmFormatoOut: errore ' + %char(%status);
           dsply msg;
           return;
         endmon;

         msg = 'Data input: ' + %trim(pmDataAlfa);
         dsply msg;
         msg = 'Formato input: ' + %trim(pmFormatoIn);
         dsply msg;
         msg = 'Data output: ' + %char(OutData);
         dsply msg;
         msg = 'Formato output: ' + %trim(pmFormatoOut);
         dsply msg;
         msg = 'Data riformattata: ' + %char(OutDataCvt);
         dsply msg;

         *inlr = *on;

       // conversione data e stringa di immagine da CYY a YYYY
       dcl-proc CYYtoYYYY;
       dcl-pi CYYtoYYYY ind;
         DataAlfa char(32767) options(*varsize:*omit);
         Formato char(32767) options(*varsize);
         FormatoSize int(10) const;
       end-pi;

       dcl-s Pos int(10) inz(*zeros);
       dcl-s ReplaceLen int(10);
       dcl-s SuffixLen int(10);
       dcl-s SuffixPos int(10);

         // ciclo sulla stringa di immagine per cercare 'CYY'
         dou Pos = *zeros;
           Pos += 1;
           if Pos > FormatoSize;
             leave;
           endif;
           Pos = %scan('CYY':%subst(Formato:1:FormatoSize):Pos);
           if Pos > *zeros;
             ReplaceLen = FormatoSize - Pos + 1;
             SuffixPos = Pos + 1;
             SuffixLen = FormatoSize - Pos;
             // sostituzione nella stringa immagine di 'C' con 'YY'
             %subst(Formato:Pos:ReplaceLen) = 'YY' +
                                 %subst(Formato:SuffixPos:SuffixLen);
             monitor;
               if %addr(DataAlfa) <> *null;
                 // estrazione del secolo dal campo data e
                 //  aggiunta di 19 per trasformarlo nei primi 2 byte dell'anno
                 %subst(DataAlfa:Pos:ReplaceLen) =
                   %char(%dec(%subst(DataAlfa:Pos:1):2:0) + 19) +
                     %subst(DataAlfa:SuffixPos:SuffixLen);
                endif;
             on-error *all;
               // errore
               return *on;
             endmon;
           endif;
         enddo;

         // tutto OK
         return *off;

       end-proc; 