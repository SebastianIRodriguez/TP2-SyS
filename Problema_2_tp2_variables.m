g = 9.8;
R=20;
L=0.01;
M=0.2;
b=0.5;
k=2;

yeq = 0.2551;
ieq = 0.5;
Feq =  (k * ieq^2)/yeq;

ki= (2 * ieq * k)/yeq;
ky= -(k * ieq^2)/yeq^2;

hold on
plot(y,'r', 'LineSmoothing','on');
plot(ylineal, 'LineSmoothing','on');
xlabel('Tiempo [s]');
ylabel('Altura [m]');
%axis([0 10 0 0.6])

hold off

grid;
legend('y','y incremental');
