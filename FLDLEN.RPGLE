      ***************************************************
      * LUNGHEZZA CAMPI DATA/ORA CONVERTITI IN NUMERICI *
      ***************************************************

      * www.markonetools.it (c) 2019

       dcl-s USA_date date(*usa);
       dcl-s ISO_date date(*iso);
       dcl-s EUR_date date(*eur);
       dcl-s JIS_date date(*jis);
       dcl-s YMD_date date(*ymd);
       dcl-s DMY_date date(*dmy);
       dcl-s MDY_date date(*mdy);
       dcl-s JUL_date date(*jul);
       dcl-s DFT_date date;

       dcl-s ISO_time time(*iso);
       dcl-s EUR_time time(*eur);
       dcl-s JIS_time time(*jis);
       dcl-s HMS_time time(*hms);
       dcl-s DFT_time time;

       dcl-s ts   timestamp;     // YYYY-MM-DD-hh.mm.ss.ffffff (default)
       dcl-s ts6  timestamp(6);  // YYYY-MM-DD-hh.mm.ss.ffffff (default)
       dcl-s ts0  timestamp(0);  // YYYY-MM-DD-hh.mm.ss
       dcl-s ts1  timestamp(1);  // YYYY-MM-DD-hh.mm.ss.f
       dcl-s ts3  timestamp(3);  // YYYY-MM-DD-hh.mm.ss.fff
       dcl-s ts12 timestamp(12); // YYYY-MM-DD-hh.mm.ss.ffffffffffff

       dcl-s len int(20);

       dcl-s msg char(52);

       // DATE
       msg = '* DATE *';
       dsply msg;

       len = %len(%dec(USA_date));
       msg = 'USA_date: ' + %char(len);
       dsply msg;

       len = %len(%dec(ISO_date));
       msg = 'ISO_date: ' + %char(len);
       dsply msg;

       len = %len(%dec(EUR_date));
       msg = 'EUR_date: ' + %char(len);
       dsply msg;

       len = %len(%dec(JIS_date));
       msg = 'JIS_date: ' + %char(len);
       dsply msg;

       len = %len(%dec(YMD_date));
       msg = 'YMD_date: ' + %char(len);
       dsply msg;

       len = %len(%dec(DMY_date));
       msg = 'DMY_date: ' + %char(len);
       dsply msg;

       len = %len(%dec(MDY_date));
       msg = 'MDY_date: ' + %char(len);
       dsply msg;

       len = %len(%dec(JUL_date));
       msg = 'JUL_date: ' + %char(len);
       dsply msg;

       len = %len(%dec(DFT_date));
       msg = 'DFT_date: ' + %char(len);
       dsply msg;

       // ORE
       msg = '* ORE *';
       dsply msg;

       len = %len(%dec(ISO_time));
       msg = 'ISO_time: ' + %char(len);
       dsply msg;

       len = %len(%dec(EUR_time));
       msg = 'EUR_time: ' + %char(len);
       dsply msg;

       len = %len(%dec(JIS_time));
       msg = 'JIS_time: ' + %char(len);
       dsply msg;

       len = %len(%dec(HMS_time));
       msg = 'HMS_time: ' + %char(len);
       dsply msg;

       len = %len(%dec(DFT_time));
       msg = 'DFT_time: ' + %char(len);
       dsply msg;

       // TIMESTAMP
       msg = '* TIMESTAMP *';
       dsply msg;

       len = %len(%dec(ts));
       msg = 'ts: ' + %char(len);
       dsply msg;

       len = %len(%dec(ts6));
       msg = 'ts6: ' + %char(len);
       dsply msg;

       len = %len(%dec(ts0));
       msg = 'ts0: ' + %char(len);
       dsply msg;

       len = %len(%dec(ts1));
       msg = 'ts1: ' + %char(len);
       dsply msg;

       len = %len(%dec(ts3));
       msg = 'ts3: ' + %char(len);
       dsply msg;

       len = %len(%dec(ts12));
       msg = 'ts12: ' + %char(len);
       dsply msg;

       *inlr = *on; 