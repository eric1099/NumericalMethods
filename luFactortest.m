clear
clc

A = [2 2 -1 9; -3 -6 2 4; 1 1 5 6; 10 5 -4 2];
[L,U,P]=luFactor(A);
[Ltest,Utest] = lu(A);