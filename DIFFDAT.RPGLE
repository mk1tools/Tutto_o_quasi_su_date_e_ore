      ****************************************************************
      * ESEMPIO DIFFERENZA TRA DATE
      ****************************************************************

      * www.markonetools.it (c) 2019
      
       ctl-opt copyright('MarkOneTools')
               indent(' ')
               option(*nodebugio: *srcstmt)
               dftactgrp(*no);

       dcl-s DataOrdine date inz(d'2019-10-01');
       dcl-s DataConsegna date inz(d'2019-10-20');
       dcl-s DataNum packed(6) inz(191105);
       dcl-s DiffGG packed(3);
       dcl-s DiffMM packed(3);

       dcl-s msg char(52);

     c     DataConsegna  subdur    DataOrdine    DiffGG:*D
         msg = 'Diff. tra ' + %char(DataConsegna:*iso) + ' e ' +
                %char(DataOrdine:*iso) + ': ' + %char(DiffGG) + ' giorni.';
         dsply msg;

         // oppure in formato libero
         DiffGG = %diff(DataConsegna : DataOrdine : *days);
         msg = 'Diff. tra ' + %char(DataConsegna:*iso) + ' e ' +
                %char(DataOrdine:*iso) + ': ' + %char(DiffGG) + ' giorni.';
         dsply msg;

         // invertendo gli argomenti si ottiene una differenza in giorni negativa
         DiffGG = %diff(DataOrdine : DataConsegna : *days);
         msg = 'Diff. tra ' + %char(DataOrdine:*iso) + ' e ' +
                %char(DataConsegna:*iso) + ': ' + %char(DiffGG) + ' giorni.';
         dsply msg;

         // la differenza è sempre un numero intero troncato
         DiffMM = %diff(DataConsegna : DataOrdine : *months);
         msg = 'Diff. tra ' + %char(DataConsegna:*iso) + ' e ' +
                %char(DataOrdine:*iso) + ': ' + %char(DiffMM) + ' mesi.';
         dsply msg;

         // calcolo della differenza contestuale a conversione
         DiffGG = %diff(%date(*date) : %date(%char(DataNum): *YMD0): *d);
         msg = 'Diff. tra ' + %char(*date) + ' e ' +
                %char(DataNum) + ': ' + %char(DiffGG) + ' giorni.';
         dsply msg;

         *inlr = *on; 