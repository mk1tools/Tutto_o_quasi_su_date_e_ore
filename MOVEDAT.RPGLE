      ****************************************************************
      * ESEMPIO CODICE OPERATIVO MOVE CON DATE
      ****************************************************************

      * www.markonetools.it (c) 2019

       ctl-opt copyright('MarkOneTools')
               indent(' ')
               option(*nodebugio: *srcstmt)
               dftactgrp(*no)
               datfmt(*YMD-) timfmt(*ISO);

       dcl-s Date1 date(*MDY/) inz(D'02-10-22');
       dcl-s Time1 time(*EUR) inz(T'13.00.00');
       dcl-s Chardate char(8) inz('03-10-22');
       dcl-s DataUSA date(*USA);
       dcl-s UpdDate date(*ISO);
       dcl-s UpdTime time(*USA);

       dcl-s msg char(52);

     C                   MOVE      Date1         UpdDate
      ***UpdDate = '2002-10-22'

     C                   MOVE      Time1         UpdTime
      ***UpdTime = '01:00 PM'

     C     *YMD-         MOVE      CharDate      DataUSA
      ***DateUSA = '10/22/2003'

     C*                  MOVEL     DateHire      CharDate
      *** Errore in compilazione: Chardate è troppo piccolo

       *inlr = *on; 