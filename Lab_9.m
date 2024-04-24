% Define the integrand function
f = @(x) 1 - x - 4*x.^3 + 2*x.^5;

% Integration limits
a = -2;
b = 4;

% Analytical solution
I = integral(f,a,b);

% Trapezoidal rule (single application)
trap_approx = (b - a) * (f(a) + f(b)) / 2;

% Composite Trapezoidal rule with n = 2
n = 2;
h = (b - a) / n;
x = a:h:b;
trap_composite_approx_n2 = h * (sum(f(x)) - (f(a) + f(b)) / 2);

% Composite Trapezoidal rule with n = 4
n = 4;
h = (b - a) / n;
x = a:h:b;
trap_composite_approx_n4 = h * (sum(f(x)) - (f(a) + f(b)) / 2);

% Simpson's 1/3 rule (single application)
simpson13_approx = (b - a) * (f(a) + 4*f((a+b)/2) + f(b)) / 6;

% Simpson's 3/8 rule (single application)
simpson38_approx = (b - a) * (f(a) + 3*f((2*a+b)/3) + 3*f((a+2*b)/3) + f(b)) / 8;

% Display results
fprintf('Analytical solution: %f\n', I);
fprintf('Trapezoidal rule (single application): %f\n', trap_approx);
fprintf('Composite Trapezoidal rule with n = 2: %f\n', trap_composite_approx_n2);
fprintf('Composite Trapezoidal rule with n = 4: %f\n', trap_composite_approx_n4);
fprintf('Simpson''s 1/3 rule (single application): %f\n', simpson13_approx);
fprintf('Simpson''s 3/8 rule (single application): %f\n', simpson38_approx);
