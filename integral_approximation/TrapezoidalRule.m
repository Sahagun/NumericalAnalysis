function solution = TrapezoidalRule(f,a,b,n)
% TRAPEZOIDALRULE  Approximates an intergral using Trapezoidal Rule.
%   solution = TRAPEZOIDALRULE(f,a,b,n) Approximates f on the [a,b] using n subintervals.
%   f: the function to be intergraded
%   a: start of the interval
%   b: end of the interval
%   n: number of sub interval
%
%   See also SIMPSONSRULE.

    h =  (a + b) / n;
    pts = a:h:b;

    trap_sol = f(a) + f(b);

    i = 2;
    while i <= n
        trap_sol = trap_sol + 2 * f(pts(n));
        i = i + 1;
    end

    solution = h / 2 * trap_sol;

end