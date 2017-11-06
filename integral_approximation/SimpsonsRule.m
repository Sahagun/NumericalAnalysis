function solution = SimpsonsRule(f,a,b,n)
% SIMPSONSRULE  Approximates an intergral using Simpson's Rule.
%   solution = SIMPSONSRULE(f,a,b,n) Approximates f on the [a,b] using n subintervals.
%   f: the function to be intergraded
%   a: start of the interval
%   b: end of the interval
%   n: number of sub interval
%
%   See also TRAPEZOIDALRULE.

    h =  (a + b) / n;
    pts = a:h:b;

    simpsons_sol = 0;

    i = 1;
    while i <= n/2
        simpsons_sol = simpsons_sol + f(pts(2*i -1)) + 4*f(pts(2*i)) + f(pts(2*i + 1));
        i = i + 1;
    end

    solution = (h/3) * simpsons_sol;
end