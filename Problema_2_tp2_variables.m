% Constantes
g = 9.8;
R=20;
L=0.01;
M=0.2;
b=0.5;
k=2;
kp=1000;
kcomp = (153.7 + ki * kp)/(ki * kp);

% Valores de equilibrio
yeq = 0.2551;
ieq = 0.5;
Feq =(k * ieq^2)/yeq;
ueq = 10;

% Constantes de aproximación lineal
ki= (2 * ieq * k)/yeq;
ky= -(k * ieq^2)/yeq^2;


% Comparación entre la incremental original y la compensada
hold on
plot(delta_y,'r', 'LineSmoothing','on');
plot(delta_y_comp, 'LineSmoothing','on');
xlabel('Tiempo [s]');
ylabel('Delta altura [m]');
hold off


%{

% Comparación entre la nolineal y la incremental
hold on
plot(y,'r', 'LineSmoothing','on');
plot(delta_y + yeq, 'LineSmoothing','on');
xlabel('Tiempo [s]');
ylabel('Delta altura [m]');
hold off

% Gráfica de y(t), i(t), u(t)
subplot(311), plot(y);
xlabel('Tiempo [s]');
ylabel('y');grid;
subplot(312), plot(imed);
xlabel('Tiempo [s]');
ylabel('i');grid;
subplot(313), plot(u);
xlabel('Tiempo [s]');
ylabel('u');grid;

%}

%{
% Gráfica de delta y(t), delta i(t), delta u(t) sobre sus valores de
% equilibrio

subplot(311), plot(delta_y + yeq);
xlabel('Tiempo [s]');
ylabel('y');grid;
subplot(312), plot(delta_i + ieq);
xlabel('Tiempo [s]');
ylabel('i');grid;
subplot(313), plot(delta_u + ueq);
xlabel('Tiempo [s]');
ylabel('u');grid;
%}

grid;