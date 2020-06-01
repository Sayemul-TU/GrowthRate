clc; close all; clear all;

% Equation: x_n+1 = r*x_n(1-x_n)

r = 2.6; % r is the growth rate
x_n = 0.6; % Initial population

% to get a parabolic curve, try -100 to 100

for i = 1:30
    iter(i) = i;
    x_n_var(1) = x_n;
    x_n_plus_1(i) = r*x_n_var(i)*(1-x_n_var(i));
    x_n_var(i+1) = x_n_plus_1(i);
end
x_n = x_n_var(1:end-1);


figure()
plot(x_n,x_n_plus_1, 'linewidth', 1.2);
set(gca, 'YTickLabel', num2cell(get(gca, 'YTick'))) %% This line changes scientific number to whole number
xlabel('x_{n}'); ylabel('x_{n+1}'); 
set(gca,'FontSize',14); 
print('x_n vs x_n+1', '-dpng', '-r300');

figure()
plot(iter,x_n_plus_1, 'linewidth', 1.2);
set(gca, 'YTickLabel', num2cell(get(gca, 'YTick'))) %% This line changes scientific number to whole number
xlabel('Year'); ylabel('x_{n+1}'); 
set(gca,'FontSize',14); 
print('Population per year', '-dpng', '-r300');

