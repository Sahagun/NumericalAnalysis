function [solution,n] = BisectionMethod(f,a,b,error)
% BISECTIONMETHOD  Finds a single root of f in the interval of [a,b].
%   solution,n = BISECTIONMETHOD(f,a,b,error) Approximates a root of f in 
%   [a,b] within error and the number of iterations to find the root.
%
%   f: the function
%   a: start of the interval
%   b: end of the interval
%   error: the desired accuarcy
%
%   note: when uinsg BISECTIONMETHOD use the Intermediate Value Theorem to
%   guarantee a existance of a root of f in [a,b]
%
%   See also HYBRIDMETHOD, SECANTMETHOD.


    c = (a + b) / 2;

    bisection_sol = f(c);
    n = 1;

    f_a_pos = f(a) > 0;
    f_b_pos = f(b) > 0;
    f_c_pos = bisection_sol > 0;

    while abs(bisection_sol) >= error
        n = n + 1;
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

        c = (a + b) / 2;
        bisection_sol = f(c);
        f_c_pos = bisection_sol > 0;

    end

    solution = bisection_sol;
    %fprintf("Bisection method sol: %ds, interations: %d \n", bisection_sol, n);
end