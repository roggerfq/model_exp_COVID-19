% Asumiendo un modelo exponencial de la forma a*exp(b*x), esta 
% sería la forma en que crecería el número de casos de COVID-19 
% en los próximos días (con límites de confianza del 95%):


close all;
clc
clear all;



y = [1,1,1,3,9,12,12,16,24,45,57,75,102,128,158,196]';
x=(1:length(y))';

f = fit(x,y,'exp1');

xp = (1:length(x)+5);

c = confint(f);

f_l=c(1,1)*exp(c(1,2)*xp);

f_c = f(xp);

f_h=c(2,1)*exp(c(2,2)*xp);



xd1 = datenum(2020, 3, 2) + x;
xd2 = datenum(2020, 3, 2) + xp;


    
area(xd2,[f_l(:) ,  f_h(:)-f_l(:)],'edgecolor','none','facealpha', 0.3); hold on
colormap([1 1 1; 0 0 1]);

    
    

p1 = plot(xd1,y,'.r','MarkerSize',20)
p2 = plot(xd2,f_c,'b','LineWidth',2)




grid on
grid minor


NumTicks = length(xp)/2;
L = get(gca,'XLim');
set(gca,'XTick',linspace(L(1),L(2),NumTicks))

datetick('x','dd-mmm','keeplimits', 'keepticks')
xtickangle(45)
set(gca,'XMinorTick','on','YMinorTick','on')



legend([p1 p2],{'casos confirmados','predicción'})

ylabel('Número de casos de COVID-19') 



    