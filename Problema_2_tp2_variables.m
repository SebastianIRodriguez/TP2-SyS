g = 9.8;
R=20;
L=0.01;
M=0.2;
b=0.5;
k=2;
kp=1000;

yeq = 0.2551;
ieq = 0.5;
Feq =  (k * ieq^2)/yeq;
ueq = 10;

ki= (2 * ieq * k)/yeq;
ky= -(k * ieq^2)/yeq^2;

%{
hold on
plot(y,'r', 'LineSmoothing','on');
plot(delta_y, 'LineSmoothing','on');
xlabel('Tiempo [s]');
ylabel('Altura [m]');
%axis([0 10 0 0.6])
%hold off
%}

subplot(311), plot(delta_y + yeq);
xlabel('Tiempo [s]');
ylabel('y');grid;
subplot(312), plot(delta_i + ieq);
xlabel('Tiempo [s]');
ylabel('i');grid;
subplot(313), plot(delta_u + ueq);
xlabel('Tiempo [s]');
ylabel('u');grid;

grid;
%legend('y incremental');