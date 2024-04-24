% Given data
x = [1 2 2.5 3 4 5];
fx = [0 5 7 6.5 2 0];

% Point for interpolation
x0 = 3.4;

% Newton's interpolating polynomial of order 1 (linear)
n1 = 1;
coeffs1 = divided_diff_coeffs(x(1:n1+1), fx(1:n1+1));
P1 = newton_interpolation(x(1:n1+1), coeffs1, x0);

% Newton's interpolating polynomial of order 2 (quadratic)
n2 = 2;
coeffs2 = divided_diff_coeffs(x(1:n2+1), fx(1:n2+1));
P2 = newton_interpolation(x(1:n2+1), coeffs2, x0);

% Newton's interpolating polynomial of order 3 (cubic)
n3 = 3;
coeffs3 = divided_diff_coeffs(x(1:n3+1), fx(1:n3+1));
P3 = newton_interpolation(x(1:n3+1), coeffs3, x0);

% Output the results
disp('Using Newton Interpolation:');
disp(['f(3.4) (order 1): ', num2str(P1)]);
disp(['f(3.4) (order 2): ', num2str(P2)]);
disp(['f(3.4) (order 3): ', num2str(P3)]);

function coeffs = divided_diff_coeffs(x, fx)
    % Compute divided difference coefficients
    n = length(x) - 1;
    coeffs = fx;
    for j = 1:n
        for i = n:-1:j+1
            coeffs(i) = (coeffs(i) - coeffs(i-1)) / (x(i) - x(i-j));
        end
    end
end

function P = newton_interpolation(x, coeffs, x0)
    % Evaluate Newton's interpolating polynomial at x0
    n = length(x) - 1;
    P = coeffs(n+1);
    for i = n:-1:1
        P = coeffs(i) + (x0 - x(i)) * P;
    end
end

% Lagrange interpolation to estimate f(3.4)
L = lagrange_interpolation(x, fx, x0);

% Output the result
disp('Using Lagrange Interpolation:');
disp(['f(3.4): ', num2str(L)]);

function L = lagrange_interpolation(x, fx, x0)
    % Lagrange interpolation to evaluate f(x0)
    n = length(x);
    L = 0;
    for j = 1:n
        lj = 1;
        for m = 1:n
            if m ~= j
                lj = lj * (x0 - x(m)) / (x(j) - x(m));
            end
        end
        L = L + fx(j) * lj;
    end
end

