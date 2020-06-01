clc; close all; clear all;

% Base Equation: x_n+1 = r*x_n(1-x_n)

r = 2.6; % r is the growth rate

% to get a parabolic curve, try -100 to 100
i = 1;
for x_n_var = -100:100
    iter(i) = i;
    x_n_plus_1(i) = r*x_n_var*(1-x_n_var);
    x_n(i) = x_n_var;
    i = i+1;
end


figure()
plot(x_n,x_n_plus_1, 'linewidth', 1.2);
set(gca, 'YTickLabel', num2cell(get(gca, 'YTick'))) %% This line changes scientific number to whole number
xlabel('x_{n}'); ylabel('x_{n+1}'); 
set(gca,'FontSize',14); 
print('x_n vs x_n+1 (ideal eqn)', '-dpng', '-r300');

