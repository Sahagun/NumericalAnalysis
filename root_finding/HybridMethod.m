function [solution, n] = HybridMethod(f,a,b,error)
% HYBRIDMETHOD  Finds a single root of f in the interval of [a,b].
%   solution,n = HYBRIDMETHOD(f,a,b,error) Approximates a root of f in 
%   [a,b] within error and the number of iterations to find the root.
%
%   f: the function
%   a: start of the interval
%   b: end of the interval
%   error: the desired accuarcy
%
%   See also BISECTIONMETHOD, SECANTMETHOD.

    s = @(x1,x2) (x1 - ((f(x1) * (x1 - x2))/(f(x1) - f(x2))));
    hybrid_sol = inf;
    hybrid_pts = zeros(1,20);

    n = 0;

    
    f_a_pos = f(a) > 0;
    f_b_pos = f(b) > 0;
    f_c_pos = true; % dummy var

    while abs(hybrid_sol) >= error
        n = n + 1;
        c = s(a,b);

        if c > a && c < b % secant
            hybrid_sol = f(c);
            hybrid_pts(n) = c;
        else % bisection
            c = (a+b)/2;
            hybrid_sol = f(c);
            hybrid_sols(n) = hybrid_sol;
            hybrid_pts(n) = c;
        end

        f_c_pos = hybrid_sol > 0;

        if f_c_pos
            if f_a_pos
                a = c;
            else
                b = c;
            end
        else
            if ~f_a_pos
                a = c;
            else
                b = c;
            end
        end

        if a > b % cool way to swap vars
           b = a + b;
           a = b - a;
           b = b - a;
        end
    end

    solution = hybrid_sol;
end