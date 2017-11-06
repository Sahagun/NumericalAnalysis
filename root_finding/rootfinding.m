% the fucntion
f = @(x) (2*x*exp(-20) - 2*exp(-20*x) + 1);

% the interval [0,1]
a = 0; b = 1;
error = 10 ^ -7;

% Bisection method
[bisection_solution, bisection_n] = BisectionMethod(f,a,b,error);
fprintf("Bisection Method sol: %ds, interations: %d \n", bisection_solution, bisection_n);

% Secant method
[secant_solution, secant_n, convergant] = SecantMethod(f,a,b,error);
if convergant
    fprintf("Secant method sol: %ds, interations: %d \n", secant_solution, secant_n);
else
    fprintf("Secant method does not converge.\n");
end

%Hybrid Method
[hybrid_solution, hybrid_n] = HybridMethod(f,a,b,error);
fprintf("Hybrid Method sol: %ds, interations: %d \n", hybrid_solution, hybrid_n);