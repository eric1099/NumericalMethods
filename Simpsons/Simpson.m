% -------------------------------------------------------------------------
% Inputs:
% x - tabulated data of independent variable (one column vector with equal 
%     intervals)
% y - tabulated data of dependent variable (one column vector)
% (x and y inputs must be equal size)
% 
% Output:
% I - an approximation of the integral 
% -------------------------------------------------------------------------
function I = Simpson(x,y)
narginchk(2,2)
[m,~] = size(x);
testx = zeros(m,1);
testx(1) = x(1);
h = (x(m)-x(1))/(m-1);
intchk = mod(m,2);
%%   
%error checks
    if size(x) == size(y)
        for i = 2:m
        testx(i) = testx(i-1)+h;
        end
        if testx == x
        else
            error('Intervals between x values must be equal')
        end
    else
        error('Tabulated x and y data does not match')
    end
%%
%caluations
    I_s = 0;
    I_t = 0;
    if intchk == 0
        warning('Trapezoidal rule will be used for the final interval')
        for b = 1:2:((m-2))
            nI_s = (h/3)*(y(b)+(4*y(b+1))+y(b+2));
            I_s = I_s + nI_s;
        end
        I_t = h*((y(m)+y(m-1))/2);
    else
        for b = 1:2:((m-1))
            nI_s = (h/3)*(y(b)+(4*y(b+1))+y(b+2));
            I_s = I_s + nI_s;
        end
    end
I = I_s + I_t;
end