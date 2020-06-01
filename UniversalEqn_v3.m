clc; close all; clear all;

x_n = 0.5; % Initial population
x_n_var(1) = x_n;

v = VideoWriter('Change in r.avi');
v.Quality = 100;
open(v);

for r = 0.01:0.05:4 % 0.01:0.05:4
    for i = 1:30
        iter(i) = i;
        x_n_plus_1(i) = r*x_n_var(i)*(1-x_n_var(i));
        x_n_var(i+1) = x_n_plus_1(i);
    end
    x_n = x_n_var(1:end-1);
    %figure()
    figure('Position',[0 0 1920 1080])
    plot(iter,x_n, '-o', 'markersize', 6, 'linewidth', 1.2);
    legend(sprintf('Growth rate (r = %.2f)',r),'location','northeast');
    ylim([0 1])
    %%set(gca, 'YTickLabel', num2cell(get(gca, 'YTick'))) %% This line changes scientific number to whole number
    
    xlabel('Year (Time)'); ylabel('Population [x_{n}]'); 
    set(gca,'FontSize',14); 
    %%print('Population per year', '-dpng', '-r300');
    frame = getframe(gcf);
    writeVideo(v,frame);
end
close(v);
close all;