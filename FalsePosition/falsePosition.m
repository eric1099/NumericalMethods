% Eric Olson
% Mech 105
% Due: 3/4/19
% Dr. Bechara

    % creation of function with given input and output values
function [root, fx, ea, iter] = falsePosition(func, x_l, x_u, es, maxiter)
    % Check for number of inputs
    % if there are anything other than 3-5 inputs, calls an error
    % If there are 3, default maxiter to 200 and es to 0.0001
    % If there are 4, default maxiter to 200
    % If there are 5, do nothing and continue
format long
origx_l = x_l - 5;
origx_u = x_u + 5;
narginchk(3,5)
if nargin == 3
    maxiter = 200;
    es = 0.0001;
elseif nargin == 4
    maxiter = 200;
else
end
    % Check that the lower bound is smaller than the upper bound
if x_l >= x_u
    error('Upper bound must be bigger than lower bound.')
else
end
    % Variables are created to change later
    % iter will count the number of iterations of the false-position method
    % ea is set to infinity so it must always be bigger than the desired es
    % Function values at lower and upper bounds are found
    % These function values are converted from systematic values to double
    % precision-float values to reduce calculation time
iter = 0;
root = 0;
ea = Inf;
fx_l = subs(func, x_l);
    fx_l = double(fx_l);
fx_u = subs(func, x_u);
    fx_u = double(fx_u);
    % While loop runs until ea <= es or iter >= maxiter 
    % Checks sign of current upper and lower bound values for sign change
    % Each loop raises iteration number by one and saves surrent guess
    % before finding new one
    % New guess is found and approximation error is calculated
    % New guess value of func is found and converted to double
    % precision-float value to reduce calculation time
    % Replaces bound with same sign of respective value in function
while ea > es && iter < maxiter
    if sign(fx_l) == sign(fx_u)
        error('Terrible interval. Try again.')
    else
    end
    iter = iter+1;
    prevroot = root;
    root = x_u - (fx_u*(x_l-x_u))/(fx_l-fx_u);
    ea = abs(((root - prevroot)/root)*100);
    fx = subs(func, root);
    fx = double(fx);
    if sign(fx) == sign(fx_l)
        x_l = root;
        fx_l = fx;
        fx_l = double(fx_l);
    elseif sign(fx) == sign(fx_u)
        x_u = root;
        fx_u = fx;
        fx_u = double(fx_u);
    end
end
    % Function and root value are plotted just for fun with window set to center around root 
fplot(func, 'b');
hold on
    plot(root,fx,'ro');
    grid
    title('False-Position Approximated Root')
    xlabel('x')
    ylabel('func(x)')
    legend('Inputted Function', 'Root')
    xlim([origx_l origx_u])
    ylim([-5 5])
hold off
    % Variables are presented to user in their respective order of output
fprintf('Root value: %.10f\nValue of f(x) at root: %.10f\nApproximate percent relative error: %.10f%%\nNumber of iterations: %.f\n',root, fx, ea, iter)
end