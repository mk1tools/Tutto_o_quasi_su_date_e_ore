      **************************************************
      * ESEMPIO CALCOLO ULTIMO GIORNO DEL MESE CON RPG *
      **************************************************

      * www.markonetools.it (c) 2019

       ctl-opt copyright('IBM corso OE85')
               indent(' ')
               datfmt(*YMD/)
               option(*nodebugio: *srcstmt)
               dftactgrp(*no);

     D DataOra         ds
     D  DateDS                       12  0
     D  TheTime                       6  0 Overlay(DateDS)
     D  TheDate                       6  0 Overlay(DateDS:7)

     D LastDay         s               d
     D Today           s               d
     D Days            s              3  0

     d Msg             s             52a

     c                   time                    DateDS
     c     *jobrun       move      TheDate       ToDay
     c                   adddur    1:*M          ToDay
     c                   extrct    Today:*D      Days
     c     Today         subdur    Days:*D       LastDay

     c                   eval      msg = 'Ultimo giorno: ' + %char(LastDay:*iso)
     c     msg           dsply

     c                   seton                                        lr 