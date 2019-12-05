      ****************************************************************
      * ESEMPIO DIFFERENZA TRA DATE
      ****************************************************************

      * www.markonetools.it (c) 2019
       
       ctl-opt copyright('MarkOneTools')
               indent(' ')
               option(*nodebugio: *srcstmt)
               dftactgrp(*no);

       dcl-s DataOrdine date inz(d'2018-11-01');
       dcl-s DataConsegna date inz(d'2019-10-20');
       dcl-s DataOrdine2 date inz(d'2009-12-01');
       dcl-s DataConsegna2 date inz(d'2019-01-20');
       dcl-s DataOrdine3 date inz(d'2008-02-29');
       dcl-s DataConsegna3 date inz(d'2008-03-29');
       dcl-s DataOrdine4 date inz(d'2008-02-29');
       dcl-s DataConsegna4 date inz(d'2008-03-31');
       dcl-s DataNum packed(6) inz(191105);
       dcl-s DiffGG packed(3);
       dcl-s DiffMM packed(3);
       dcl-s DiffMM2 packed(31:15);
       dcl-s Diff char(10);
       dcl-s DiffInt int(20);

       dcl-s msg char(52);

         // differenza in giorni
         exec sql
           set :DiffGG = days(:DataConsegna) - days(:DataOrdine);
         msg = 'FUNZIONE SQL days';
         dsply msg;
         msg = 'Diff. tra ' + %char(DataConsegna:*iso) + ' e ' +
                %char(DataOrdine:*iso) + ': ' + %char(DiffGG) + ' giorni.';
         dsply msg;

         DiffGG = %diff(DataConsegna : DataOrdine : *days);
         msg = 'FUNZIONE RPG %diff con 3° parametro *days';
         dsply msg;
         msg = 'Diff. tra ' + %char(DataConsegna:*iso) + ' e ' +
                %char(DataOrdine:*iso) + ': ' + %char(DiffGG) + ' giorni.';
         dsply msg;

         // differenza in mesi
         exec sql
           set :DiffMM = month(:DataConsegna) - month(:DataOrdine);
         msg = 'FUNZIONE SQL month';
         dsply msg;
         msg = 'Diff. tra ' + %char(DataConsegna:*iso) + ' e ' +
                %char(DataOrdine:*iso) + ': ' + %char(DiffMM) + ' mesi.';
         dsply msg;

         DiffMM = %diff(DataConsegna : DataOrdine : *months);
         msg = 'FUNZIONE RPG %diff con 3° parametro *months';
         dsply msg;
         msg = 'Diff. tra ' + %char(DataConsegna:*iso) + ' e ' +
                %char(DataOrdine:*iso) + ': ' + %char(DiffMM) + ' mesi.';
         dsply msg;

         // differenza composta
         exec sql
           set :Diff = date(:DataConsegna) - date(:DataOrdine);
         msg = 'FUNZIONE SQL date';
         dsply msg;
         msg = 'Diff. tra ' + %char(DataConsegna:*iso) + ' e ' +
                %char(DataOrdine:*iso) + ': ' + Diff;
         dsply msg;
         msg = 'ovvero: ' + %subst(Diff:1:2) + ' mm ' +
                            %subst(Diff:3:2) + ' gg';
         dsply msg;

         exec sql
           set :Diff = date(:DataConsegna2) - date(:DataOrdine2);
         msg = 'FUNZIONE SQL date';
         dsply msg;
         msg = 'Diff. tra ' + %char(DataConsegna2:*iso) + ' e ' +
                %char(DataOrdine2:*iso) + ': ' + Diff;
         dsply msg;
         msg = 'ovvero: ' + %subst(Diff:1:1) + ' aa ' +
                            %subst(Diff:2:2) + ' mm ' +
                            %subst(Diff:4:2) + ' gg';
         dsply msg;

         // differenza stimata in mesi
         exec sql
           set :DiffMM2 = months_between(:DataConsegna, :DataOrdine);
         msg = 'FUNZIONE SQL months_between';
         dsply msg;
         msg = 'Diff. tra ' + %char(DataConsegna:*iso) + ' e ' +
                %char(DataOrdine:*iso) + ': ' + %char(DiffMM2);
         dsply msg;

         exec sql
           set :DiffMM2 = months_between(:DataConsegna2, :DataOrdine2);
         msg = 'FUNZIONE SQL months_between';
         dsply msg;
         msg = 'Diff. tra ' + %char(DataConsegna2:*iso) + ' e ' +
                %char(DataOrdine2:*iso) + ': ' + %char(DiffMM2);
         dsply msg;

         exec sql
           set :DiffMM2 = months_between(:DataConsegna3, :DataOrdine3);
         msg = 'FUNZIONE SQL months_between';
         dsply msg;
         msg = 'Diff. tra ' + %char(DataConsegna3:*iso) + ' e ' +
                %char(DataOrdine3:*iso) + ': ' + %char(DiffMM2);
         dsply msg;

         exec sql
           set :DiffMM2 = months_between(:DataConsegna4, :DataOrdine4);
         msg = 'FUNZIONE SQL months_between';
         dsply msg;
         msg = 'Diff. tra ' + %char(DataConsegna4:*iso) + ' e ' +
                %char(DataOrdine4:*iso) + ': ' + %char(DiffMM2);
         dsply msg;

         // differenza in mesi con timestampdiff
         exec sql
           set :DiffInt =
             timestampdiff(64,
               cast(cast(:DataConsegna as timestamp) -
                    cast(:DataOrdine as timestamp) as char(22)));
         msg = 'FUNZIONE SQL timestampdiff (mesi)';
         dsply msg;
         msg = 'Diff. tra ' + %char(DataConsegna:*iso) + ' e ' +
                %char(DataOrdine:*iso) + ': ' + %char(DiffInt);
         dsply msg;

         exec sql
           set :DiffInt =
             timestampdiff(64,
               cast(cast(:DataConsegna2 as timestamp) -
                    cast(:DataOrdine2 as timestamp) as char(22)));
         msg = 'FUNZIONE SQL timestampdiff (mesi)';
         dsply msg;
         msg = 'Diff. tra ' + %char(DataConsegna2:*iso) + ' e ' +
                %char(DataOrdine2:*iso) + ': ' + %char(DiffInt);
         dsply msg;

         exec sql
           set :DiffInt =
             timestampdiff(64,
               cast(cast(:DataConsegna3 as timestamp) -
                    cast(:DataOrdine3 as timestamp) as char(22)));
         msg = 'FUNZIONE SQL timestampdiff (mesi)';
         dsply msg;
         msg = 'Diff. tra ' + %char(DataConsegna3:*iso) + ' e ' +
                %char(DataOrdine3:*iso) + ': ' + %char(DiffInt);
         dsply msg;

         exec sql
           set :DiffInt =
             timestampdiff(64,
               cast(cast(:DataConsegna4 as timestamp) -
                    cast(:DataOrdine4 as timestamp) as char(22)));
         msg = 'FUNZIONE SQL timestampdiff (mesi)';
         dsply msg;
         msg = 'Diff. tra ' + %char(DataConsegna4:*iso) + ' e ' +
                %char(DataOrdine4:*iso) + ': ' + %char(DiffInt);
         dsply msg;

         // differenza in giorni con timestampdiff
         exec sql
           set :DiffInt =
             timestampdiff(16,
               cast(cast(:DataConsegna as timestamp) -
                    cast(:DataOrdine as timestamp) as char(22)));
         msg = 'FUNZIONE SQL timestampdiff (giorni)';
         dsply msg;
         msg = 'Diff. tra ' + %char(DataConsegna:*iso) + ' e ' +
                %char(DataOrdine:*iso) + ': ' + %char(DiffInt);
         dsply msg;

         exec sql
           set :DiffInt =
             timestampdiff(16,
               cast(cast(:DataConsegna2 as timestamp) -
                    cast(:DataOrdine2 as timestamp) as char(22)));
         msg = 'FUNZIONE SQL timestampdiff (giorni)';
         dsply msg;
         msg = 'Diff. tra ' + %char(DataConsegna2:*iso) + ' e ' +
                %char(DataOrdine2:*iso) + ': ' + %char(DiffInt);
         dsply msg;

         exec sql
           set :DiffInt =
             timestampdiff(16,
               cast(cast(:DataConsegna3 as timestamp) -
                    cast(:DataOrdine3 as timestamp) as char(22)));
         msg = 'FUNZIONE SQL timestampdiff (giorni)';
         dsply msg;
         msg = 'Diff. tra ' + %char(DataConsegna3:*iso) + ' e ' +
                %char(DataOrdine3:*iso) + ': ' + %char(DiffInt);
         dsply msg;

         exec sql
           set :DiffInt =
             timestampdiff(16,
               cast(cast(:DataConsegna4 as timestamp) -
                    cast(:DataOrdine4 as timestamp) as char(22)));
         msg = 'FUNZIONE SQL timestampdiff (giorni)';
         dsply msg;
         msg = 'Diff. tra ' + %char(DataConsegna4:*iso) + ' e ' +
                %char(DataOrdine4:*iso) + ': ' + %char(DiffInt);
         dsply msg;

         *inlr = *on; 