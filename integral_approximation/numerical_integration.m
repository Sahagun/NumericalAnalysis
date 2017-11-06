theta = pi/6; % 30 degrees

% inerval [0, pi/2]
a = 0; b = pi / 2;


L = 1;      % length = 1 meter
g = 9.8;    % g = 9.8 meter/sec^2  (gravity constant)

n = 20;     % number of subintervals

% The function to intergrate (I put the constant back into the intergal for readablilty)
k = sin(theta/2);
c = (4*sqrt(L/g));
f = @(x)  c * (1 - k^2 * sin(x)^2 )^ -.5;

% TrapezoidalRule approx. times the rest of the fucntion
trapezoidal_solution = TrapezoidalRule(f,a,b,n);
fprintf("Trapezoidal Rule solution: %f, subintervals: %d \n", trapezoidal_solution, n);

simpsons_solution = SimpsonsRule(f,a,b,n);
fprintf("Simoson's Rule solution: %f, subintervals: %d \n", simpsons_solution, n);