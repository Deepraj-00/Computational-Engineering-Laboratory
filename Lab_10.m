% Parameters
y0 = 1;  % Initial condition y(0)
T = 2;   % Endpoint of the interval
h1 = 0.5;  % Step size 1
h2 = 0.25; % Step size 2

% Function definition
f = @(t, y) y * t^2 - 1.1 * y;

% Analytical solution
t_values = 0:0.01:T;
y_analytical = y0 * exp(t_values.^3 / 3 - 1.1 * t_values);

% Euler's method for step size h1
t_euler_h1 = 0:h1:T;
y_euler_h1 = zeros(size(t_euler_h1));
y_euler_h1(1) = y0;
for i = 1:length(t_euler_h1) - 1
    y_euler_h1(i+1) = y_euler_h1(i) + h1 * f(t_euler_h1(i), y_euler_h1(i));
end

% Euler's method for step size h2
t_euler_h2 = 0:h2:T;
y_euler_h2 = zeros(size(t_euler_h2));
y_euler_h2(1) = y0;
for i = 1:length(t_euler_h2) - 1
    y_euler_h2(i+1) = y_euler_h2(i) + h2 * f(t_euler_h2(i), y_euler_h2(i));
end

% Plotting
figure;
plot(t_values, y_analytical, 'b-', t_euler_h1, y_euler_h1, 'ro-', t_euler_h2, y_euler_h2, 'gx-');
legend('Analytical Solution', ['Euler (h = ' num2str(h1) ')'], ['Euler (h = ' num2str(h2) ')']);
xlabel('t');
ylabel('y(t)');
title('Analytical Solution vs Euler''s Method');
grid on;
