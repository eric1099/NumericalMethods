clear
clc

x_l = -1;
x_u = 1;
func = @(x)sin(x);
es = 0.0001;
maxiter = 200;
falsePosition(func, x_l, x_u,es,maxiter);