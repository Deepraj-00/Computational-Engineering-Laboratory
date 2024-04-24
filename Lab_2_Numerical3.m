% Define the x values
x = linspace(-2*pi,2*pi,150);

% Calculate the tangent values
y = tan(x);

% Plot the tangent function
figure;
plot(x,y,'LineWidth',2);
title('Plot of tan(x)');
xlabel('x');
ylabel('y');
grid on;

% Set xlim and ylim for better aesthetics
xlim([-2*pi,2*pi]);
ylim([-10,10]);