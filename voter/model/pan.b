	switch (t->back) {
	default: Uerror("bad return move");
	case  0: goto R999; /* nothing to undo */

		 /* PROC Voter */

	case 3: /* STATE 1 */
		;
		((P1 *)this)->_3_i = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 5: /* STATE 3 */
		;
		now.res_possiveis[ Index(((P1 *)this)->_3_i, 3) ] = trpt->bup.oval;
		;
		goto R999;

	case 6: /* STATE 6 */
		;
		((P1 *)this)->_3_i = trpt->bup.ovals[2];
		((P1 *)this)->_3_real_results[ Index(((P1 *)this)->_3_i, 3) ].a[1] = trpt->bup.ovals[1];
		((P1 *)this)->_3_real_results[ Index(((P1 *)this)->_3_i, 3) ].a[0] = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 3);
		goto R999;

	case 7: /* STATE 12 */
		;
		((P1 *)this)->_3_i = trpt->bup.ovals[1];
	/* 0 */	((P1 *)this)->_3_i = trpt->bup.ovals[0];
		;
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 8: /* STATE 12 */
		;
		((P1 *)this)->_3_i = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 10: /* STATE 14 */
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 11: /* STATE 15 */
		;
		((P1 *)this)->_3_i = trpt->bup.oval;
		;
		goto R999;

	case 12: /* STATE 16 */
		;
	/* 0 */	((P1 *)this)->_3_i = trpt->bup.oval;
		;
		;
		goto R999;
;
		;
		
	case 14: /* STATE 26 */
		;
		((P1 *)this)->_3_i = trpt->bup.oval;
		;
		goto R999;
;
		;
		;
		;
		
	case 17: /* STATE 30 */
		;
		((P1 *)this)->_3_j = trpt->bup.ovals[1];
		((P1 *)this)->_3_exists = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;
;
		;
		;
		;
		
	case 20: /* STATE 33 */
		;
		((P1 *)this)->_3_real_results[ Index(((P1 *)this)->_3_j, 3) ].a[1] = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 22: /* STATE 44 */
		;
		((P1 *)this)->_3_j = trpt->bup.ovals[1];
		((P1 *)this)->_3_exists = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 23: /* STATE 44 */
		;
		((P1 *)this)->_3_j = trpt->bup.oval;
		;
		goto R999;

	case 24: /* STATE 44 */
		;
		((P1 *)this)->_3_j = trpt->bup.oval;
		;
		goto R999;

	case 25: /* STATE 45 */
		;
	/* 0 */	((P1 *)this)->_3_j = trpt->bup.oval;
		;
		;
		goto R999;
;
		
	case 26: /* STATE 50 */
		goto R999;

	case 27: /* STATE 51 */
		;
	/* 0 */	((P1 *)this)->_3_exists = trpt->bup.oval;
		;
		;
		goto R999;

	case 28: /* STATE 52 */
		;
		((P1 *)this)->_3_real_results[ Index(((P1 *)this)->_3_nresults, 3) ].a[0] = trpt->bup.oval;
		;
		goto R999;

	case 29: /* STATE 63 */
		;
		((P1 *)this)->_3_i = trpt->bup.ovals[2];
		((P1 *)this)->_3_nresults = trpt->bup.ovals[1];
		((P1 *)this)->_3_real_results[ Index(((P1 *)this)->_3_nresults, 3) ].a[1] = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 3);
		goto R999;

	case 30: /* STATE 63 */
		;
		((P1 *)this)->_3_i = trpt->bup.oval;
		;
		goto R999;

	case 31: /* STATE 63 */
		;
		((P1 *)this)->_3_i = trpt->bup.oval;
		;
		goto R999;

	case 32: /* STATE 63 */
		;
		((P1 *)this)->_3_i = trpt->bup.oval;
		;
		goto R999;

	case 33: /* STATE 69 */
		;
		((P1 *)this)->_3_i = trpt->bup.ovals[1];
	/* 0 */	((P1 *)this)->_3_i = trpt->bup.ovals[0];
		;
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 34: /* STATE 69 */
		;
		((P1 *)this)->_3_i = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 36: /* STATE 81 */
		;
		((P1 *)this)->_3_i = trpt->bup.ovals[4];
		((P1 *)this)->_3_valid = trpt->bup.ovals[3];
		((P1 *)this)->_3_best_value = trpt->bup.ovals[2];
		((P1 *)this)->_3_best_occur = trpt->bup.ovals[1];
	/* 0 */	((P1 *)this)->_3_best_occur = trpt->bup.ovals[0];
		;
		;
		ungrab_ints(trpt->bup.ovals, 5);
		goto R999;

	case 37: /* STATE 81 */
		;
		((P1 *)this)->_3_i = trpt->bup.ovals[1];
		((P1 *)this)->_3_valid = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 38: /* STATE 81 */
		;
		((P1 *)this)->_3_i = trpt->bup.oval;
		;
		goto R999;

	case 39: /* STATE 81 */
		;
		((P1 *)this)->_3_i = trpt->bup.oval;
		;
		goto R999;

	case 40: /* STATE 82 */
		;
	/* 1 */	((P1 *)this)->_3_nresults = trpt->bup.ovals[1];
	/* 0 */	((P1 *)this)->_3_i = trpt->bup.ovals[0];
		;
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 41: /* STATE 87 */
		;
	/* 0 */	((P1 *)this)->_3_valid = trpt->bup.oval;
		;
		;
		goto R999;
;
		;
		
	case 43: /* STATE 93 */
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC webServer */

	case 44: /* STATE 2 */
		;
		((P0 *)this)->_2_wsresult = trpt->bup.oval;
		;
		goto R999;

	case 45: /* STATE 4 */
		;
		((P0 *)this)->_2_wsresult = trpt->bup.oval;
		(((P0 *)this)->_2_wsresult<=5);
		;
		goto R999;

	case 46: /* STATE 9 */
		;
		now.res_possiveis[ Index(((P0 *)this)->wsinstance, 3) ] = trpt->bup.oval;
		;
		goto R999;

	case 47: /* STATE 11 */
		;
		now.res_possiveis[ Index(((P0 *)this)->wsinstance, 3) ] = trpt->bup.oval;
		;
		goto R999;

	case 48: /* STATE 14 */
		;
		p_restor(II);
		;
		;
		goto R999;
	}

