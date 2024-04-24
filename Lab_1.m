% Parameters
T0 = 70;         % Initial temperature of the coffee (°C)
Ta = 20;         % Ambient temperature (°C)
k = 0.019;       % Proportionality constant (per minute)
t_start = 0;     % Start time (min)
t_end = 20;      % End time (min)
dt = 2;          % Step size (min)

% Number of steps
num_steps = (t_end - t_start) / dt;

% Initialize arrays
time = zeros(num_steps + 1, 1);   % Time array
temperature = zeros(num_steps + 1, 1);  % Temperature array

% Set initial conditions
time(1) = t_start;
temperature(1) = T0;

% Euler's method to approximate the solution
for i = 1:num_steps
    dTdt = -k * (temperature(i) - Ta);
    temperature(i + 1) = temperature(i) + dt * dTdt;
    time(i + 1) = time(i) + dt;
end

% Analytical solution for comparison
% T(t) = Ta + (T0 - Ta) * exp(-k * t)
analytical_temperature = Ta + (T0 - Ta) * exp(-k * time);

% Plotting results
figure;
plot(time, temperature, 'b-o', time, analytical_temperature, 'r--');
xlabel('Time (min)');
ylabel('Temperature (°C)');
legend('Numerical (Euler''s Method)', 'Analytical');
title('Cooling of Coffee Over Time');
grid on;
