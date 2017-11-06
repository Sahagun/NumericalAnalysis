function [solution,n,convergant] = SecantMethod(f,a,b,error)
% SECANTMETHOD  Finds a single root of f in the interval of [a,b].
%   solution,n,convergant = SECANTMETHOD(f,a,b,error) Approximates a root of
%   f in [a,b] within error and the number of iterations to find the root. 
%   convergant is a boolean value, if convergant is false
%   a root was not found.
%
%   f: the function
%   a: start of the interval
%   b: end of the interval
%   error: the desired accuarcy
%
%   note: SECANTMETHOD is not guarantee to converge to a root. Check 
%       convergant to see if a valid solution was found.
%
%   See also BISECTIONMETHOD, HYBRIDMETHOD.    

    s = @(x1,x2) (x1 - ((f(x1) * (x1 - x2))/(f(x1) - f(x2))));

    c = s(a,b);
    n = 1;

    secant_sol = f(c);
    
    secants_pts = zeros(1,20);
    secants_pts(n) = a;
    secants_pts(n+1) = b;
    secants_pts(n+2) = c;

    convergant = c < max(a,b) && c > min(a,b);

    while abs(secant_sol) >= error && n < 50 && convergant
        a = secants_pts(n+1);
        b = secants_pts(n+2);
        c = s(a,b);
        secant_sol = f(c);

        n = n + 1;
        secants_pts(n+3) = c;
        convergant = c < max(secants_pts(1),secants_pts(2)) && c > min(secants_pts(1),secants_pts(2));
    end

    solution = secant_sol;
end