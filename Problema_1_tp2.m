clear, clc

datos_TP2_P1_2020;

%Realizar Simulacion
[t,x] = ode45('sistema_rotacional',[0 10],[0;0;0;0]);

%Grafica de variables simuladas
%{
subplot(411), plot(t,x(:,1), 'r', 'LineSmoothing','on');
xlabel('Tiempo [s]'); ylabel('x1 = theta1 [rad]'); grid;

subplot(412), plot(t,x(:,2), 'LineSmoothing','on');
xlabel('Tiempo [s]'); ylabel('x2 = w1 [rad/s]'); grid;

subplot(413), plot(t,x(:,3), 'r', 'LineSmoothing','on');
xlabel('Tiempo [s]'); ylabel('x3 = theta2 [rad]'); grid;

subplot(414), plot(t,x(:,4), 'LineSmoothing','on');
xlabel('Tiempo [s]'); ylabel('x4 = w2 [rad/s]'); grid;
%}
 
%Definicion de Parametros
k1=2.7114;
k2=k1;
j1=0.009;
j2=j1;
b1=0.02;
b2=b1;

%Definicion de matrices de las Ecuaciones de Estado
A = [0 1 0 0;-k1/j1 -b2/j1 k1/j1 0;0 0 0 1;k1/j2 0 (-k1-k2)/j2 -b1/j2];
 
B = [0; 1/j1; 0; 0];

C = [1 0 0 0];

D = 0;
 
%Busqueda de Polos y Ceros de la Transferencia
[num, den] = ss2tf(A, B, C, D);

H = tf(num, den)
 
polos = roots(den)
ceros = roots(num)

%Grafica comparativa de la inercia 2
%{
hold on
plot(t,x(:,3),'r', 'LineSmoothing','on');
plot(evol(:,2),evol(:,5)/2544, 'LineSmoothing','on');
xlabel('Tiempo [s]');
grid;
axis([0 10 -0.7 0.7])

hold off

legend('theta2 simulado','theta2 medida');
%}

%Grafica comparativa de la inercia 1

hold on
plot(t,x(:,1),'r', 'LineSmoothing','on');
plot(evol(:,2),evol(:,4)/2544, 'LineSmoothing','on');
xlabel('Tiempo [s]');
grid;
axis([0 10 -0.7 0.7])

hold off
legend('theta1 simulado','theta1 medida');


%Diagrama de Bode del sistema
%bode(A, B, C, D);grid;