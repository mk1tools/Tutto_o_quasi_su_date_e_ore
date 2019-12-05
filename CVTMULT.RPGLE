      *****************************************************************
      * ESEMPIO CONVERSIONE FORMATO DA YMD A MDY con un semplice MULT *
      *****************************************************************

      * www.markonetools.it (c) 2019

       ctl-opt copyright('MarkOneTools')
               indent(' ')
               decedit('0,')
               option(*nodebugio: *srcstmt)
               dftactgrp(*no);

       // data ora in input
       dcl-s pmDataI char(6);
       dcl-s wDataI packed(6);
       // data output
       dcl-s pmDataO packed(6);

       dcl-s Msg char(52);

     c     *entry        plist
     c                   parm                    pmDataI

     c                   movel     pmDataI       wDataI
     c     wDataI        mult      100,0001      pmDataO

       msg = 'Conversione da: ' + pmDataI + ' a: ' + %char(pmDataO);
       dsply msg;

       *inlr = *on; 