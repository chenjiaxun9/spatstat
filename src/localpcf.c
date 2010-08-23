#include <R.h>
#include <Rmath.h>

/*

  localpcf.c

  $Revision: 1.14 $     $Date: 2008/06/23 01:47:55 $

  Assumes point patterns are sorted in increasing order of x coordinate

*/

void locpcfx(nn1, x1, y1, id1, 
	     nn2, x2, y2, id2, 
	     nnr, rmaxi, 
	     del, pcf)
     /* inputs */
     int *nn1, *nn2, *nnr;
     double *x1, *y1, *x2, *y2;
     int *id1, *id2;
     double *rmaxi, *del;
     /* output */
     double *pcf;  /* matrix of column vectors of pcf's 
		      for each point of first pattern */
{
  int n1, n2, nr, i, j, k, jleft, jright, kmin, kmax, id1i;
  double x1i, y1i, rmax, r2max, delta, xleft, xright, dx, dy;
  double d2, d2max, dmax, d;
  double rstep, rvalue, frac, contrib, weight, coef;

  n1 = *nn1;
  n2 = *nn2;
  nr = *nnr;
  rmax = *rmaxi;
  delta = *del;

  dmax = rmax + delta; /* maximum relevant value of interpoint distance */
  r2max = rmax * rmax;
  d2max = dmax * dmax;
  rstep = rmax/(nr-1);
  coef  = 3.0 /(4.0 * delta);

  if(n1 == 0 || n2 == 0) 
    return;

  jleft = jright = 0;

  for(i = 0; i < n1; i++) {
    x1i = x1[i];
    y1i = y1[i];
    id1i = id1[i];
    /* search all points with x in [xleft, xright] */
    xleft = x1i - rmax;
    xright = x1i + rmax;

    /* 
       adjust scope of search [jleft, jright]

    */
    while((jleft+1 < n2) && x2[jleft] < xleft)
      ++jleft;

    while((jright+1 < n2) && x2[jright+1] <= xright)
      ++jright;

    /* 
       process from jleft to jright
    */
    for(j=jleft; j <= jright; j++) {
      /* squared interpoint distance */
      dx = x2[j] - x1i;
      dy = y2[j] - y1i;
      d2 = dx * dx + dy * dy;
      if(d2 <= d2max && id2[j] != id1i) {
	d = sqrt(d2);
	kmin = (int) floor((d-delta)/rstep);
	kmax = (int) ceil((d+delta)/rstep);
	if(kmin <= nr-1 && kmax >= 0) {
	  /* nonempty intersection with range of r values */
	  /* compute intersection */
	  if(kmin < 0) kmin = 0; 
	  if(kmax >= nr) kmax = nr-1;
	  /* */
	  weight = coef/d;
	  for(k = kmin; k <= kmax; k++) {
	    rvalue = k * rstep;
	    frac = (d - rvalue)/delta;
	    /* Epanechnikov kernel with halfwidth delta */
	    contrib = (1 - frac * frac);
	    if(contrib > 0) 
	      pcf[k + nr * i] += contrib * weight;
	  }
	}
      }
    }
  }
}
