% Given data points
x = [0, 2, 4, 6, 9, 11, 12, 15, 17, 19];
y = [5, 6, 7, 6, 9, 8, 8, 10, 12, 12];

% Linear Regression by Hand Calculation
n = length(x);
x_bar = mean(x);
y_bar = mean(y);

SS_xy = sum((x - x_bar) .* (y - y_bar));
SS_xx = sum((x - x_bar) .^ 2);

m = SS_xy / SS_xx;
b = y_bar - m * x_bar;

fprintf('Linear Regression by Hand:\n');
fprintf('Slope (m) = %.4f\n', m);
fprintf('Y-Intercept (b) = %.4f\n', b);

% Linear Regression using polyfit (degree 1) in MATLAB
p_linear = polyfit(x, y, 1);

fprintf('\nLinear Regression using polyfit:\n');
fprintf('Slope (m) = %.4f\n', p_linear(1));
fprintf('Y-Intercept (b) = %.4f\n', p_linear(2));

% Polynomial Regression using polyfit (degree 2) in MATLAB
p_poly = polyfit(x, y, 2);

% Evaluate Goodness of Fit (R-squared) for Linear and Polynomial (2nd degree) Models
y_fit_linear = polyval(p_linear, x);
y_fit_poly = polyval(p_poly, x);

SS_tot = sum((y - y_bar) .^ 2);
SS_res_linear = sum((y - y_fit_linear) .^ 2);
SS_res_poly = sum((y - y_fit_poly) .^ 2);

R2_linear = 1 - (SS_res_linear / SS_tot);
R2_poly = 1 - (SS_res_poly / SS_tot);

fprintf('\nGoodness of Fit (R-squared):\n');
fprintf('Linear Fit: R^2 = %.4f\n', R2_linear);
fprintf('Polynomial Fit (2nd degree): R^2 = %.4f\n', R2_poly);

% Plotting
figure;
plot(x, y, 'bo', 'MarkerSize', 8);
hold on;
plot(x, y_fit_linear, 'r-', 'LineWidth', 1.5);
plot(x, y_fit_poly, 'g--', 'LineWidth', 1.5);
xlabel('x');
ylabel('y');
title('Curve Fitting and Goodness of Fit');
legend('Data Points', 'Linear Fit', 'Polynomial Fit (2nd degree)', 'Location', 'best');
grid on;
