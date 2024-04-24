% Define the function F(x)
F = @(x) x.^10 - 1;

% Define the interval [x1, xu]
x1 = 0;
xu = 1.3;

% Desired error tolerance
err = 0.01;

% Initialize iteration counter and root estimate
iter = 0;
xr = (x1 + xu) / 2;

% Perform bisection method
while abs(F(xr)) > err
    % Calculate function values at endpoints and midpoint
    y1 = F(x1);
    yr = F(xr);
    yu = F(xu);
    
    % Determine which subinterval to select
    if y1 * yr < 0
        % Root is in the lower subinterval
        xu = xr;
    else
        % Root is in the upper subinterval
        x1 = xr;
    end
    
    % Calculate new midpoint
    xr = (x1 + xu) / 2;
    
    % Increment iteration counter
    iter = iter + 1;
end

% Display the root and number of iterations
fprintf('Root of the equation = %.6f\n', xr);
fprintf('Number of iterations = %d\n', iter);

% Plot the function F(x) and mark the root
x_vals = linspace(0, 1.3, 100);
y_vals = F(x_vals);

figure;
plot(x_vals, y_vals, 'b-', 'LineWidth', 1.5);
hold on;
plot(xr, F(xr), 'ro', 'MarkerSize', 8, 'MarkerFaceColor', 'r');
xlabel('x');
ylabel('F(x)');
title('Bisection Method for Root Finding');
grid on;
legend('F(x) = x^{10} - 1', 'Root Estimate', 'Location', 'best');

