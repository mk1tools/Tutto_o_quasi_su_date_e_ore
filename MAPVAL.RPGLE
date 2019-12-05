      ****************************************************************
      * ESEMPIO UTILIZZO KEYWORD MAPVAL
      ****************************************************************

      * www.markonetools.it (c) 2019

       ctl-opt copyright('MarkOneTools')
               indent(' ')
               option(*nodebugio: *srcstmt)
               datedit(*dmy);

       dcl-f MAPVALV workstn;

       dcl-s ForEverTrue ind inz(*on);

       dow ForEverTrue;

         exfmt FMT01;

         select;
           // F1=Data default
           when *INKA;
             WSDATA = d'0001-01-01';
             WSDATC = d'0001-01-02';
           // F2=Data corrente
           when *INKB;
             WSDATA = %date();
             WSDATC = %date();
           // F3=Fine
           when *INKC;
             leave;
           other;
         endsl;
         WSDAT2 = WSDATA;
         WSDAT3 = WSDATC;

       enddo;

       *inlr = *on; 