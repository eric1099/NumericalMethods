%--------------------------------------------------------------------------
%                                                         Eric Olson
%                                                         4/3/19
%                                                         Bechara
%                                                         MECH 105
%Inputs:
%   A: a square matrix of linear system coefficients
%Ouputs:
%   L: lower triangular matrix as a result of the LU factorization
%   U: lower triangular matrix as a result of the LU factorization,
%      shows coefficients of factored systems
%   P: pivot matrix displaying changes in rows due to pivoting
% (if solving for x, B matrix must also be pivoted with the L and P)
%--------------------------------------------------------------------------
function[L,U,P]=luFactor(A)
narginchk(1,1)
format short
narginchk(1,1)
[m,n] = size(A);
if m == n
else
    error('The A matrix must be a square')
end
L = eye(m,n);
P = L;
U = A;
for col = 2:n
    row = col;
    iter = 1;
    absU = abs(U);
    maxval = max(absU(row-1:n,col-1));
    [maxr,maxc] = find(absU == maxval);
    oldU = U(row-1,:);
    U(row-1,:) = U(maxr,:);
    U(maxr,:) = oldU;
    oldP = P(row-1,:);
    P(row-1,:) = P(maxr,:);
    P(maxr,:) = oldP;
    while row <= n
        if iter < row
            L(row,col-1) = U(row,col-1)/U(col-1,col-1);
            U(row,:) = U(row,:) - (U(row-iter,:) * L(row,col-1));
            row = row+1;
            iter = iter+1;
        else
            break
        end
    end
end
fprintf('L matrix:\n\n')
    disp(L)
fprintf('U matrix:\n\n')
    disp(U)
fprintf('P matrix:\n\n')
    disp(P)
end