% Parameters and grid setup
L = 0.75;           % Length of the rod (meters)
dx = 0.025;         % Spatial step size (meters)
dt = 0.00015;       % Time step (seconds)
k = 1;              % Thermal conductivity (W/m°C)

% Number of nodes along the rod
n = round(L / dx) + 1;

% Spatial grid
x = linspace(0, L, n);

% Initial temperature profile (e.g., at t = 0)
T0 = zeros(1, n);   % Initially, temperature is zero everywhere
T0(1) = 100;        % Set a boundary condition at x = 0 (e.g., 100°C)

% Time-stepping loop
num_steps = 500;  % Number of time steps
T = T0;           % Initialize temperature profile

for step = 1:num_steps
    % Compute new temperature profile using explicit finite difference
    T_new = zeros(1, n);
    
    % Update internal nodes (excluding boundary nodes)
    for i = 2:n-1
        T_new(i) = T(i) + k * (dt / dx^2) * (T(i+1) - 2*T(i) + T(i-1));
    end
    
    % Update boundary condition (e.g., Dirichlet boundary at x = 0)
    T_new(1) = 100;  % Maintain a constant temperature at the boundary
    
    % Update T for the next time step
    T = T_new;
end

% Plot the temperature profile at the final time step
figure;
plot(x, T, '-o');
title('Temperature Profile of the Rod');
xlabel('Position (m)');
ylabel('Temperature (°C)');
grid on;
