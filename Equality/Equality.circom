pragma circom 2.1.4;

include "../node_modules/circomlib/circuits/comparators.circom";

// Input 3 values using 'a'(array of length 3) and check if they all are equal.
// Return using signal 'c'.

template Equality() {
   signal input a[3];
   signal output c;

   // subtract first from second and third
   // if all equal, both diffs should be 0
   signal diff1 <== a[1] - a[0];
   signal diff2 <== a[2] - a[0];
   signal invdiff1 <--  diff1!=0 ? 1/diff1 : 0;
   signal invdiff2 <-- diff2!=0 ? 1/diff2 : 0;
   signal prod1 <== diff1*invdiff1;
    signal prod2 <== diff2*invdiff2;
   signal diff123 <== prod1+prod2;

   component isz = IsZero();
   isz.in <== diff123;

   c <== isz.out;
}

component main = Equality();
