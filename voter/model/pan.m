#define rand	pan_rand
#if defined(HAS_CODE) && defined(VERBOSE)
	cpu_printf("Pr: %d Tr: %d\n", II, t->forw);
#endif
	switch (t->forw) {
	default: Uerror("bad forward move");
	case 0:	/* if without executable clauses */
		continue;
	case 1: /* generic 'goto' or 'skip' */
		IfNotBlocked
		_m = 3; goto P999;
	case 2: /* generic 'else' */
		IfNotBlocked
		if (trpt->o_pm&1) continue;
		_m = 3; goto P999;

		 /* PROC Voter */
	case 3: /* STATE 1 - .\voter_model.pml:46 - [i = 0] (0:0:1 - 1) */
		IfNotBlocked
		reached[1][1] = 1;
		(trpt+1)->bup.oval = ((int)((P1 *)this)->_3_i);
		((P1 *)this)->_3_i = 0;
#ifdef VAR_RANGES
		logval("Voter:i", ((int)((P1 *)this)->_3_i));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 4: /* STATE 2 - .\voter_model.pml:48 - [((i<3))] (0:0:0 - 1) */
		IfNotBlocked
		reached[1][2] = 1;
		if (!((((int)((P1 *)this)->_3_i)<3)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 5: /* STATE 3 - .\voter_model.pml:49 - [res_possiveis[i] = -(1)] (0:0:1 - 1) */
		IfNotBlocked
		reached[1][3] = 1;
		(trpt+1)->bup.oval = now.res_possiveis[ Index(((int)((P1 *)this)->_3_i), 3) ];
		now.res_possiveis[ Index(((P1 *)this)->_3_i, 3) ] =  -(1);
#ifdef VAR_RANGES
		logval("res_possiveis[Voter:i]", now.res_possiveis[ Index(((int)((P1 *)this)->_3_i), 3) ]);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 6: /* STATE 4 - .\voter_model.pml:51 - [real_results[i].a[0] = -(1)] (0:9:3 - 1) */
		IfNotBlocked
		reached[1][4] = 1;
		(trpt+1)->bup.ovals = grab_ints(3);
		(trpt+1)->bup.ovals[0] = ((P1 *)this)->_3_real_results[ Index(((int)((P1 *)this)->_3_i), 3) ].a[0];
		((P1 *)this)->_3_real_results[ Index(((P1 *)this)->_3_i, 3) ].a[0] =  -(1);
#ifdef VAR_RANGES
		logval("Voter:real_results[Voter:i].a[0]", ((P1 *)this)->_3_real_results[ Index(((int)((P1 *)this)->_3_i), 3) ].a[0]);
#endif
		;
		/* merge: real_results[i].a[1] = 0(9, 5, 9) */
		reached[1][5] = 1;
		(trpt+1)->bup.ovals[1] = ((P1 *)this)->_3_real_results[ Index(((int)((P1 *)this)->_3_i), 3) ].a[1];
		((P1 *)this)->_3_real_results[ Index(((P1 *)this)->_3_i, 3) ].a[1] = 0;
#ifdef VAR_RANGES
		logval("Voter:real_results[Voter:i].a[1]", ((P1 *)this)->_3_real_results[ Index(((int)((P1 *)this)->_3_i), 3) ].a[1]);
#endif
		;
		/* merge: i = (i+1)(9, 6, 9) */
		reached[1][6] = 1;
		(trpt+1)->bup.ovals[2] = ((int)((P1 *)this)->_3_i);
		((P1 *)this)->_3_i = (((int)((P1 *)this)->_3_i)+1);
#ifdef VAR_RANGES
		logval("Voter:i", ((int)((P1 *)this)->_3_i));
#endif
		;
		/* merge: .(goto)(0, 10, 9) */
		reached[1][10] = 1;
		;
		_m = 3; goto P999; /* 3 */
	case 7: /* STATE 7 - .\voter_model.pml:54 - [((i>=3))] (18:0:2 - 1) */
		IfNotBlocked
		reached[1][7] = 1;
		if (!((((int)((P1 *)this)->_3_i)>=3)))
			continue;
		/* dead 1: _3_i */  (trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((P1 *)this)->_3_i;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P1 *)this)->_3_i = 0;
		/* merge: goto :b1(18, 8, 18) */
		reached[1][8] = 1;
		;
		/* merge: i = 0(18, 12, 18) */
		reached[1][12] = 1;
		(trpt+1)->bup.ovals[1] = ((int)((P1 *)this)->_3_i);
		((P1 *)this)->_3_i = 0;
#ifdef VAR_RANGES
		logval("Voter:i", ((int)((P1 *)this)->_3_i));
#endif
		;
		/* merge: .(goto)(0, 19, 18) */
		reached[1][19] = 1;
		;
		_m = 3; goto P999; /* 3 */
	case 8: /* STATE 12 - .\voter_model.pml:58 - [i = 0] (0:18:1 - 3) */
		IfNotBlocked
		reached[1][12] = 1;
		(trpt+1)->bup.oval = ((int)((P1 *)this)->_3_i);
		((P1 *)this)->_3_i = 0;
#ifdef VAR_RANGES
		logval("Voter:i", ((int)((P1 *)this)->_3_i));
#endif
		;
		/* merge: .(goto)(0, 19, 18) */
		reached[1][19] = 1;
		;
		_m = 3; goto P999; /* 1 */
	case 9: /* STATE 13 - .\voter_model.pml:60 - [((i<3))] (0:0:0 - 1) */
		IfNotBlocked
		reached[1][13] = 1;
		if (!((((int)((P1 *)this)->_3_i)<3)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 10: /* STATE 14 - .\voter_model.pml:61 - [(run webServer(i))] (0:0:0 - 1) */
		IfNotBlocked
		reached[1][14] = 1;
		if (!(addproc(0, ((int)((P1 *)this)->_3_i))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 11: /* STATE 15 - .\voter_model.pml:62 - [i = (i+1)] (0:0:1 - 1) */
		IfNotBlocked
		reached[1][15] = 1;
		(trpt+1)->bup.oval = ((int)((P1 *)this)->_3_i);
		((P1 *)this)->_3_i = (((int)((P1 *)this)->_3_i)+1);
#ifdef VAR_RANGES
		logval("Voter:i", ((int)((P1 *)this)->_3_i));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 12: /* STATE 16 - .\voter_model.pml:63 - [((i>=3))] (0:0:1 - 1) */
		IfNotBlocked
		reached[1][16] = 1;
		if (!((((int)((P1 *)this)->_3_i)>=3)))
			continue;
		/* dead 1: _3_i */  (trpt+1)->bup.oval = ((P1 *)this)->_3_i;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P1 *)this)->_3_i = 0;
		_m = 3; goto P999; /* 0 */
	case 13: /* STATE 21 - .\voter_model.pml:68 - [(timeout)] (0:0:0 - 1) */
		IfNotBlocked
		reached[1][21] = 1;
		if (!(((trpt->tau)&1)))
			continue;
		_m = 1; goto P999; /* 0 */
	case 14: /* STATE 26 - .\voter_model.pml:73 - [i = 0] (0:66:1 - 3) */
		IfNotBlocked
		reached[1][26] = 1;
		(trpt+1)->bup.oval = ((int)((P1 *)this)->_3_i);
		((P1 *)this)->_3_i = 0;
#ifdef VAR_RANGES
		logval("Voter:i", ((int)((P1 *)this)->_3_i));
#endif
		;
		/* merge: .(goto)(0, 67, 66) */
		reached[1][67] = 1;
		;
		_m = 3; goto P999; /* 1 */
	case 15: /* STATE 27 - .\voter_model.pml:75 - [((i<3))] (0:0:0 - 1) */
		IfNotBlocked
		reached[1][27] = 1;
		if (!((((int)((P1 *)this)->_3_i)<3)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 16: /* STATE 28 - .\voter_model.pml:78 - [((res_possiveis[i]>=0))] (0:0:0 - 1) */
		IfNotBlocked
		reached[1][28] = 1;
		if (!((now.res_possiveis[ Index(((int)((P1 *)this)->_3_i), 3) ]>=0)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 17: /* STATE 29 - .\voter_model.pml:84 - [exists = 0] (0:47:2 - 1) */
		IfNotBlocked
		reached[1][29] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((int)((P1 *)this)->_3_exists);
		((P1 *)this)->_3_exists = 0;
#ifdef VAR_RANGES
		logval("Voter:exists", ((int)((P1 *)this)->_3_exists));
#endif
		;
		/* merge: j = 0(47, 30, 47) */
		reached[1][30] = 1;
		(trpt+1)->bup.ovals[1] = ((int)((P1 *)this)->_3_j);
		((P1 *)this)->_3_j = 0;
#ifdef VAR_RANGES
		logval("Voter:j", ((int)((P1 *)this)->_3_j));
#endif
		;
		/* merge: .(goto)(0, 48, 47) */
		reached[1][48] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 18: /* STATE 31 - .\voter_model.pml:88 - [((j<nresults))] (0:0:0 - 1) */
		IfNotBlocked
		reached[1][31] = 1;
		if (!((((int)((P1 *)this)->_3_j)<((P1 *)this)->_3_nresults)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 19: /* STATE 32 - .\voter_model.pml:90 - [((((res_possiveis[i]-1)<=real_results[j].a[0])&&((res_possiveis[i]+1)>=real_results[j].a[0])))] (0:0:0 - 1) */
		IfNotBlocked
		reached[1][32] = 1;
		if (!((((now.res_possiveis[ Index(((int)((P1 *)this)->_3_i), 3) ]-1)<=((P1 *)this)->_3_real_results[ Index(((int)((P1 *)this)->_3_j), 3) ].a[0])&&((now.res_possiveis[ Index(((int)((P1 *)this)->_3_i), 3) ]+1)>=((P1 *)this)->_3_real_results[ Index(((int)((P1 *)this)->_3_j), 3) ].a[0]))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 20: /* STATE 33 - .\voter_model.pml:91 - [real_results[j].a[1] = (real_results[j].a[1]+1)] (0:0:1 - 1) */
		IfNotBlocked
		reached[1][33] = 1;
		(trpt+1)->bup.oval = ((P1 *)this)->_3_real_results[ Index(((int)((P1 *)this)->_3_j), 3) ].a[1];
		((P1 *)this)->_3_real_results[ Index(((P1 *)this)->_3_j, 3) ].a[1] = (((P1 *)this)->_3_real_results[ Index(((int)((P1 *)this)->_3_j), 3) ].a[1]+1);
#ifdef VAR_RANGES
		logval("Voter:real_results[Voter:j].a[1]", ((P1 *)this)->_3_real_results[ Index(((int)((P1 *)this)->_3_j), 3) ].a[1]);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 21: /* STATE 38 - .\voter_model.pml:95 - [((res_possiveis[i]==real_results[j].a[0]))] (0:0:0 - 1) */
		IfNotBlocked
		reached[1][38] = 1;
		if (!((now.res_possiveis[ Index(((int)((P1 *)this)->_3_i), 3) ]==((P1 *)this)->_3_real_results[ Index(((int)((P1 *)this)->_3_j), 3) ].a[0])))
			continue;
		_m = 3; goto P999; /* 0 */
	case 22: /* STATE 39 - .\voter_model.pml:95 - [exists = 1] (0:47:2 - 1) */
		IfNotBlocked
		reached[1][39] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((int)((P1 *)this)->_3_exists);
		((P1 *)this)->_3_exists = 1;
#ifdef VAR_RANGES
		logval("Voter:exists", ((int)((P1 *)this)->_3_exists));
#endif
		;
		/* merge: .(goto)(47, 43, 47) */
		reached[1][43] = 1;
		;
		/* merge: j = (j+1)(47, 44, 47) */
		reached[1][44] = 1;
		(trpt+1)->bup.ovals[1] = ((int)((P1 *)this)->_3_j);
		((P1 *)this)->_3_j = (((int)((P1 *)this)->_3_j)+1);
#ifdef VAR_RANGES
		logval("Voter:j", ((int)((P1 *)this)->_3_j));
#endif
		;
		/* merge: .(goto)(0, 48, 47) */
		reached[1][48] = 1;
		;
		_m = 3; goto P999; /* 3 */
	case 23: /* STATE 41 - .\voter_model.pml:96 - [(1)] (47:0:1 - 1) */
		IfNotBlocked
		reached[1][41] = 1;
		if (!(1))
			continue;
		/* merge: .(goto)(47, 43, 47) */
		reached[1][43] = 1;
		;
		/* merge: j = (j+1)(47, 44, 47) */
		reached[1][44] = 1;
		(trpt+1)->bup.oval = ((int)((P1 *)this)->_3_j);
		((P1 *)this)->_3_j = (((int)((P1 *)this)->_3_j)+1);
#ifdef VAR_RANGES
		logval("Voter:j", ((int)((P1 *)this)->_3_j));
#endif
		;
		/* merge: .(goto)(0, 48, 47) */
		reached[1][48] = 1;
		;
		_m = 3; goto P999; /* 3 */
	case 24: /* STATE 44 - .\voter_model.pml:98 - [j = (j+1)] (0:47:1 - 3) */
		IfNotBlocked
		reached[1][44] = 1;
		(trpt+1)->bup.oval = ((int)((P1 *)this)->_3_j);
		((P1 *)this)->_3_j = (((int)((P1 *)this)->_3_j)+1);
#ifdef VAR_RANGES
		logval("Voter:j", ((int)((P1 *)this)->_3_j));
#endif
		;
		/* merge: .(goto)(0, 48, 47) */
		reached[1][48] = 1;
		;
		_m = 3; goto P999; /* 1 */
	case 25: /* STATE 45 - .\voter_model.pml:99 - [((j>=nresults))] (57:0:1 - 1) */
		IfNotBlocked
		reached[1][45] = 1;
		if (!((((int)((P1 *)this)->_3_j)>=((P1 *)this)->_3_nresults)))
			continue;
		/* dead 1: _3_j */  (trpt+1)->bup.oval = ((P1 *)this)->_3_j;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P1 *)this)->_3_j = 0;
		/* merge: goto :b5(57, 46, 57) */
		reached[1][46] = 1;
		;
		/* merge: assert((nresults<3))(57, 50, 57) */
		reached[1][50] = 1;
		spin_assert((((P1 *)this)->_3_nresults<3), "(nresults<3)", II, tt, t);
		_m = 3; goto P999; /* 2 */
	case 26: /* STATE 50 - .\voter_model.pml:102 - [assert((nresults<3))] (0:57:0 - 3) */
		IfNotBlocked
		reached[1][50] = 1;
		spin_assert((((P1 *)this)->_3_nresults<3), "(nresults<3)", II, tt, t);
		_m = 3; goto P999; /* 0 */
	case 27: /* STATE 51 - .\voter_model.pml:106 - [((exists==0))] (0:0:1 - 1) */
		IfNotBlocked
		reached[1][51] = 1;
		if (!((((int)((P1 *)this)->_3_exists)==0)))
			continue;
		/* dead 1: _3_exists */  (trpt+1)->bup.oval = ((P1 *)this)->_3_exists;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P1 *)this)->_3_exists = 0;
		_m = 3; goto P999; /* 0 */
	case 28: /* STATE 52 - .\voter_model.pml:107 - [real_results[nresults].a[0] = res_possiveis[i]] (0:0:1 - 1) */
		IfNotBlocked
		reached[1][52] = 1;
		(trpt+1)->bup.oval = ((P1 *)this)->_3_real_results[ Index(((P1 *)this)->_3_nresults, 3) ].a[0];
		((P1 *)this)->_3_real_results[ Index(((P1 *)this)->_3_nresults, 3) ].a[0] = now.res_possiveis[ Index(((int)((P1 *)this)->_3_i), 3) ];
#ifdef VAR_RANGES
		logval("Voter:real_results[Voter:nresults].a[0]", ((P1 *)this)->_3_real_results[ Index(((P1 *)this)->_3_nresults, 3) ].a[0]);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 29: /* STATE 53 - .\voter_model.pml:108 - [real_results[nresults].a[1] = 1] (0:66:3 - 1) */
		IfNotBlocked
		reached[1][53] = 1;
		(trpt+1)->bup.ovals = grab_ints(3);
		(trpt+1)->bup.ovals[0] = ((P1 *)this)->_3_real_results[ Index(((P1 *)this)->_3_nresults, 3) ].a[1];
		((P1 *)this)->_3_real_results[ Index(((P1 *)this)->_3_nresults, 3) ].a[1] = 1;
#ifdef VAR_RANGES
		logval("Voter:real_results[Voter:nresults].a[1]", ((P1 *)this)->_3_real_results[ Index(((P1 *)this)->_3_nresults, 3) ].a[1]);
#endif
		;
		/* merge: nresults = (nresults+1)(66, 54, 66) */
		reached[1][54] = 1;
		(trpt+1)->bup.ovals[1] = ((P1 *)this)->_3_nresults;
		((P1 *)this)->_3_nresults = (((P1 *)this)->_3_nresults+1);
#ifdef VAR_RANGES
		logval("Voter:nresults", ((P1 *)this)->_3_nresults);
#endif
		;
		/* merge: .(goto)(66, 58, 66) */
		reached[1][58] = 1;
		;
		/* merge: .(goto)(66, 62, 66) */
		reached[1][62] = 1;
		;
		/* merge: i = (i+1)(66, 63, 66) */
		reached[1][63] = 1;
		(trpt+1)->bup.ovals[2] = ((int)((P1 *)this)->_3_i);
		((P1 *)this)->_3_i = (((int)((P1 *)this)->_3_i)+1);
#ifdef VAR_RANGES
		logval("Voter:i", ((int)((P1 *)this)->_3_i));
#endif
		;
		/* merge: .(goto)(0, 67, 66) */
		reached[1][67] = 1;
		;
		_m = 3; goto P999; /* 5 */
	case 30: /* STATE 56 - .\voter_model.pml:110 - [(1)] (66:0:1 - 1) */
		IfNotBlocked
		reached[1][56] = 1;
		if (!(1))
			continue;
		/* merge: .(goto)(66, 58, 66) */
		reached[1][58] = 1;
		;
		/* merge: .(goto)(66, 62, 66) */
		reached[1][62] = 1;
		;
		/* merge: i = (i+1)(66, 63, 66) */
		reached[1][63] = 1;
		(trpt+1)->bup.oval = ((int)((P1 *)this)->_3_i);
		((P1 *)this)->_3_i = (((int)((P1 *)this)->_3_i)+1);
#ifdef VAR_RANGES
		logval("Voter:i", ((int)((P1 *)this)->_3_i));
#endif
		;
		/* merge: .(goto)(0, 67, 66) */
		reached[1][67] = 1;
		;
		_m = 3; goto P999; /* 4 */
	case 31: /* STATE 60 - .\voter_model.pml:112 - [(1)] (66:0:1 - 1) */
		IfNotBlocked
		reached[1][60] = 1;
		if (!(1))
			continue;
		/* merge: .(goto)(66, 62, 66) */
		reached[1][62] = 1;
		;
		/* merge: i = (i+1)(66, 63, 66) */
		reached[1][63] = 1;
		(trpt+1)->bup.oval = ((int)((P1 *)this)->_3_i);
		((P1 *)this)->_3_i = (((int)((P1 *)this)->_3_i)+1);
#ifdef VAR_RANGES
		logval("Voter:i", ((int)((P1 *)this)->_3_i));
#endif
		;
		/* merge: .(goto)(0, 67, 66) */
		reached[1][67] = 1;
		;
		_m = 3; goto P999; /* 3 */
	case 32: /* STATE 63 - .\voter_model.pml:114 - [i = (i+1)] (0:66:1 - 5) */
		IfNotBlocked
		reached[1][63] = 1;
		(trpt+1)->bup.oval = ((int)((P1 *)this)->_3_i);
		((P1 *)this)->_3_i = (((int)((P1 *)this)->_3_i)+1);
#ifdef VAR_RANGES
		logval("Voter:i", ((int)((P1 *)this)->_3_i));
#endif
		;
		/* merge: .(goto)(0, 67, 66) */
		reached[1][67] = 1;
		;
		_m = 3; goto P999; /* 1 */
	case 33: /* STATE 64 - .\voter_model.pml:115 - [((i>=3))] (84:0:2 - 1) */
		IfNotBlocked
		reached[1][64] = 1;
		if (!((((int)((P1 *)this)->_3_i)>=3)))
			continue;
		/* dead 1: _3_i */  (trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((P1 *)this)->_3_i;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P1 *)this)->_3_i = 0;
		/* merge: goto :b4(84, 65, 84) */
		reached[1][65] = 1;
		;
		/* merge: i = 0(84, 69, 84) */
		reached[1][69] = 1;
		(trpt+1)->bup.ovals[1] = ((int)((P1 *)this)->_3_i);
		((P1 *)this)->_3_i = 0;
#ifdef VAR_RANGES
		logval("Voter:i", ((int)((P1 *)this)->_3_i));
#endif
		;
		/* merge: .(goto)(0, 85, 84) */
		reached[1][85] = 1;
		;
		_m = 3; goto P999; /* 3 */
	case 34: /* STATE 69 - .\voter_model.pml:119 - [i = 0] (0:84:1 - 3) */
		IfNotBlocked
		reached[1][69] = 1;
		(trpt+1)->bup.oval = ((int)((P1 *)this)->_3_i);
		((P1 *)this)->_3_i = 0;
#ifdef VAR_RANGES
		logval("Voter:i", ((int)((P1 *)this)->_3_i));
#endif
		;
		/* merge: .(goto)(0, 85, 84) */
		reached[1][85] = 1;
		;
		_m = 3; goto P999; /* 1 */
	case 35: /* STATE 70 - .\voter_model.pml:121 - [((i<nresults))] (0:0:0 - 1) */
		IfNotBlocked
		reached[1][70] = 1;
		if (!((((int)((P1 *)this)->_3_i)<((P1 *)this)->_3_nresults)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 36: /* STATE 71 - .\voter_model.pml:123 - [((real_results[i].a[1]>best_occur))] (84:0:5 - 1) */
		IfNotBlocked
		reached[1][71] = 1;
		if (!((((P1 *)this)->_3_real_results[ Index(((int)((P1 *)this)->_3_i), 3) ].a[1]>((P1 *)this)->_3_best_occur)))
			continue;
		/* dead 1: _3_best_occur */  (trpt+1)->bup.ovals = grab_ints(5);
		(trpt+1)->bup.ovals[0] = ((P1 *)this)->_3_best_occur;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P1 *)this)->_3_best_occur = 0;
		/* merge: best_occur = real_results[i].a[1](84, 72, 84) */
		reached[1][72] = 1;
		(trpt+1)->bup.ovals[1] = ((P1 *)this)->_3_best_occur;
		((P1 *)this)->_3_best_occur = ((P1 *)this)->_3_real_results[ Index(((int)((P1 *)this)->_3_i), 3) ].a[1];
#ifdef VAR_RANGES
		logval("Voter:best_occur", ((P1 *)this)->_3_best_occur);
#endif
		;
		/* merge: best_value = real_results[i].a[0](84, 73, 84) */
		reached[1][73] = 1;
		(trpt+1)->bup.ovals[2] = ((P1 *)this)->_3_best_value;
		((P1 *)this)->_3_best_value = ((P1 *)this)->_3_real_results[ Index(((int)((P1 *)this)->_3_i), 3) ].a[0];
#ifdef VAR_RANGES
		logval("Voter:best_value", ((P1 *)this)->_3_best_value);
#endif
		;
		/* merge: valid = 1(84, 74, 84) */
		reached[1][74] = 1;
		(trpt+1)->bup.ovals[3] = ((int)((P1 *)this)->_3_valid);
		((P1 *)this)->_3_valid = 1;
#ifdef VAR_RANGES
		logval("Voter:valid", ((int)((P1 *)this)->_3_valid));
#endif
		;
		/* merge: .(goto)(84, 80, 84) */
		reached[1][80] = 1;
		;
		/* merge: i = (i+1)(84, 81, 84) */
		reached[1][81] = 1;
		(trpt+1)->bup.ovals[4] = ((int)((P1 *)this)->_3_i);
		((P1 *)this)->_3_i = (((int)((P1 *)this)->_3_i)+1);
#ifdef VAR_RANGES
		logval("Voter:i", ((int)((P1 *)this)->_3_i));
#endif
		;
		/* merge: .(goto)(0, 85, 84) */
		reached[1][85] = 1;
		;
		_m = 3; goto P999; /* 6 */
	case 37: /* STATE 75 - .\voter_model.pml:127 - [((real_results[i].a[1]==best_occur))] (84:0:2 - 1) */
		IfNotBlocked
		reached[1][75] = 1;
		if (!((((P1 *)this)->_3_real_results[ Index(((int)((P1 *)this)->_3_i), 3) ].a[1]==((P1 *)this)->_3_best_occur)))
			continue;
		/* merge: valid = 0(84, 76, 84) */
		reached[1][76] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((int)((P1 *)this)->_3_valid);
		((P1 *)this)->_3_valid = 0;
#ifdef VAR_RANGES
		logval("Voter:valid", ((int)((P1 *)this)->_3_valid));
#endif
		;
		/* merge: .(goto)(84, 80, 84) */
		reached[1][80] = 1;
		;
		/* merge: i = (i+1)(84, 81, 84) */
		reached[1][81] = 1;
		(trpt+1)->bup.ovals[1] = ((int)((P1 *)this)->_3_i);
		((P1 *)this)->_3_i = (((int)((P1 *)this)->_3_i)+1);
#ifdef VAR_RANGES
		logval("Voter:i", ((int)((P1 *)this)->_3_i));
#endif
		;
		/* merge: .(goto)(0, 85, 84) */
		reached[1][85] = 1;
		;
		_m = 3; goto P999; /* 4 */
	case 38: /* STATE 78 - .\voter_model.pml:129 - [(1)] (84:0:1 - 1) */
		IfNotBlocked
		reached[1][78] = 1;
		if (!(1))
			continue;
		/* merge: .(goto)(84, 80, 84) */
		reached[1][80] = 1;
		;
		/* merge: i = (i+1)(84, 81, 84) */
		reached[1][81] = 1;
		(trpt+1)->bup.oval = ((int)((P1 *)this)->_3_i);
		((P1 *)this)->_3_i = (((int)((P1 *)this)->_3_i)+1);
#ifdef VAR_RANGES
		logval("Voter:i", ((int)((P1 *)this)->_3_i));
#endif
		;
		/* merge: .(goto)(0, 85, 84) */
		reached[1][85] = 1;
		;
		_m = 3; goto P999; /* 3 */
	case 39: /* STATE 81 - .\voter_model.pml:131 - [i = (i+1)] (0:84:1 - 4) */
		IfNotBlocked
		reached[1][81] = 1;
		(trpt+1)->bup.oval = ((int)((P1 *)this)->_3_i);
		((P1 *)this)->_3_i = (((int)((P1 *)this)->_3_i)+1);
#ifdef VAR_RANGES
		logval("Voter:i", ((int)((P1 *)this)->_3_i));
#endif
		;
		/* merge: .(goto)(0, 85, 84) */
		reached[1][85] = 1;
		;
		_m = 3; goto P999; /* 1 */
	case 40: /* STATE 82 - .\voter_model.pml:132 - [((i>=nresults))] (0:0:2 - 1) */
		IfNotBlocked
		reached[1][82] = 1;
		if (!((((int)((P1 *)this)->_3_i)>=((P1 *)this)->_3_nresults)))
			continue;
		/* dead 1: _3_i */  (trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((P1 *)this)->_3_i;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P1 *)this)->_3_i = 0;
		/* dead 1: _3_nresults */  (trpt+1)->bup.ovals[1] = ((P1 *)this)->_3_nresults;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P1 *)this)->_3_nresults = 0;
		_m = 3; goto P999; /* 0 */
	case 41: /* STATE 87 - .\voter_model.pml:137 - [((valid==1))] (93:0:1 - 1) */
		IfNotBlocked
		reached[1][87] = 1;
		if (!((((int)((P1 *)this)->_3_valid)==1)))
			continue;
		/* dead 1: _3_valid */  (trpt+1)->bup.oval = ((P1 *)this)->_3_valid;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P1 *)this)->_3_valid = 0;
		/* merge: printf('O resultado e %d e obteve &d votos',best_value,best_occur)(0, 88, 93) */
		reached[1][88] = 1;
		Printf("O resultado e %d e obteve &d votos", ((P1 *)this)->_3_best_value, ((P1 *)this)->_3_best_occur);
		/* merge: .(goto)(0, 92, 93) */
		reached[1][92] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 42: /* STATE 90 - .\voter_model.pml:138 - [printf('Nao foi possivel obter um resultado por maioria')] (0:0:0 - 1) */
		IfNotBlocked
		reached[1][90] = 1;
		Printf("Nao foi possivel obter um resultado por maioria");
		_m = 3; goto P999; /* 0 */
	case 43: /* STATE 93 - .\voter_model.pml:141 - [-end-] (0:0:0 - 3) */
		IfNotBlocked
		reached[1][93] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC webServer */
	case 44: /* STATE 1 - .\voter_model.pml:18 - [(1)] (6:0:1 - 1) */
		IfNotBlocked
		reached[0][1] = 1;
		if (!(1))
			continue;
		/* merge: wsresult = 0(0, 2, 6) */
		reached[0][2] = 1;
		(trpt+1)->bup.oval = ((P0 *)this)->_2_wsresult;
		((P0 *)this)->_2_wsresult = 0;
#ifdef VAR_RANGES
		logval("webServer:wsresult", ((P0 *)this)->_2_wsresult);
#endif
		;
		/* merge: .(goto)(0, 7, 6) */
		reached[0][7] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 45: /* STATE 3 - .\voter_model.pml:19 - [(wsresult<=5)] (0:6:1 - 1) */
		IfNotBlocked
		reached[0][3] = 1;
		(((P0 *)this)->_2_wsresult<=5);
		/* merge: wsresult = (wsresult+1)(6, 4, 6) */
		reached[0][4] = 1;
		(trpt+1)->bup.oval = ((P0 *)this)->_2_wsresult;
		((P0 *)this)->_2_wsresult = (((P0 *)this)->_2_wsresult+1);
#ifdef VAR_RANGES
		logval("webServer:wsresult", ((P0 *)this)->_2_wsresult);
#endif
		;
		/* merge: .(goto)(0, 7, 6) */
		reached[0][7] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 46: /* STATE 9 - .\voter_model.pml:20 - [res_possiveis[wsinstance] = wsresult] (0:0:1 - 2) */
		IfNotBlocked
		reached[0][9] = 1;
		(trpt+1)->bup.oval = now.res_possiveis[ Index(((P0 *)this)->wsinstance, 3) ];
		now.res_possiveis[ Index(((P0 *)this)->wsinstance, 3) ] = ((P0 *)this)->_2_wsresult;
#ifdef VAR_RANGES
		logval("res_possiveis[webServer:wsinstance]", now.res_possiveis[ Index(((P0 *)this)->wsinstance, 3) ]);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 47: /* STATE 11 - .\voter_model.pml:22 - [res_possiveis[wsinstance] = -(1)] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][11] = 1;
		(trpt+1)->bup.oval = now.res_possiveis[ Index(((P0 *)this)->wsinstance, 3) ];
		now.res_possiveis[ Index(((P0 *)this)->wsinstance, 3) ] =  -(1);
#ifdef VAR_RANGES
		logval("res_possiveis[webServer:wsinstance]", now.res_possiveis[ Index(((P0 *)this)->wsinstance, 3) ]);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 48: /* STATE 14 - .\voter_model.pml:24 - [-end-] (0:0:0 - 3) */
		IfNotBlocked
		reached[0][14] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */
	case  _T5:	/* np_ */
		if (!((!(trpt->o_pm&4) && !(trpt->tau&128))))
			continue;
		/* else fall through */
	case  _T2:	/* true */
		_m = 3; goto P999;
#undef rand
	}

