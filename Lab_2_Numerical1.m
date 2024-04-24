% Define the range of x values
x = linspace(-5,5,100);

% Define all the functions
y1 = x;
y2 = x.^3;
y3 = exp(x);
y4 = sin(x).*cos(x);

% Plot the functions
figure;
plot(x,y1,'LineWidth',2,'DisplayName','y_1 = x');
hold on;
plot(x,y2,'LineWidth',2,'DisplayName','y_2 = x^3');
plot(x,y3,'LineWidth',2,'DisplayName','y_3 = e^x');
plot(x,y4,'LineWidth',2,'DisplayName','y_4 = sin(x)*cos(x)');

% Label the axes and add a legend
xlabel('x');
ylabel('y');
title('Plot of functions');
legend('Location','best');
grid on;

% Display the plot
hold off;



