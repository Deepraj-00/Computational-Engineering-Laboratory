% Given data
x = [0.6 1.5 1.6 2.5 3.5];
f = 5 * exp(-2*x) .* x; % Compute f(x) = 5*e^(-2*x)*x

% True derivative of f(x)
true_derivative = @(x) 5 * exp(-2*x) .* (1 - 2*x);

% Compute first-derivative estimates
n = length(x);
df_estimated = zeros(size(x));

for i = 1:n
    if i == 1
        % Forward difference at the first point
        h = x(i+1) - x(i);
        df_estimated(i) = (f(i+1) - f(i)) / h;
    elseif i == n
        % Backward difference at the last point
        h = x(i) - x(i-1);
        df_estimated(i) = (f(i) - f(i-1)) / h;
    else
        % Centered difference at interior points
        h1 = x(i) - x(i-1);
        h2 = x(i+1) - x(i);
        df_estimated(i) = (f(i+1) - f(i-1)) / (h1 + h2);
    end
end

% Compare estimated derivatives with true derivatives
disp('x       f(x)           df/dx (Estimated)     df/dx (True)');
disp('-----------------------------------------------------------');
for i = 1:n
    fprintf('%.2f    %.4f          %.4f               %.4f\n', x(i), f(i), df_estimated(i), true_derivative(x(i)));
end

% Plotting the function f(x) and its estimated derivatives
figure;
plot(x, f, 'b-', 'LineWidth', 1.5); % Plot f(x)
hold on;
plot(x, df_estimated, 'ro-', 'LineWidth', 1.5); % Plot estimated derivatives
plot(x, true_derivative(x), 'g--', 'LineWidth', 1.5); % Plot true derivatives
hold off;
legend('f(x)', 'df/dx (Estimated)', 'df/dx (True)', 'Location', 'best');
xlabel('x');
ylabel('Function value / Derivative');
title('Comparison of f(x) and its Derivatives');
grid on;
