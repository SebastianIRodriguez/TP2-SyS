%clear, clc

[t,x] = ode45('sistema_rotacional',[0 14],[0;0;0;0]);

%{
subplot(411), plot(t,x(:,1));xlabel('Tiempo [s]');
ylabel('x1 = d1');grid;
subplot(412), plot(t,x(:,2));xlabel('Tiempo [s]');
ylabel('x2 = v1');grid;
subplot(413), plot(t,x(:,3));xlabel('Tiempo [s]');
ylabel('x3 = d2');grid;
subplot(414), plot(t,x(:,4));xlabel('Tiempo [s]');
ylabel('x4 = v2');grid;
%}
 


k1=2.7114;
k2=k1;
j1=0.009;
j2=j1;
b1=0.02;
b2=b1;

A = [0 1 0 0;-k1/j1 -b2/j1 k1/j1 0;0 0 0 1;k1/j2 0 (-k1-k2)/j2 -b1/j2];
 
B = [0; 1/j1; 0; 0];

C = [1 0 0 0];

D = 0;
 
[num, den] = ss2tf(A, B, C, D);

H = tf(num, den)
 
polos = roots(den)
ceros = roots(num)


hold on
plot(t,x(:,3),'r', 'LineSmoothing','on');
plot(evol(:,2),evol(:,5)/2544, 'LineSmoothing','on');
xlabel('Tiempo [s]');
grid;
axis([0 10 -0.75 0.75])

hold off

legend('x3 = theta2','theta2 medida');


%{
hold on
plot(t,x(:,1),'r', 'LineSmoothing','on');
plot(evol(:,2),evol(:,4)/2544, 'LineSmoothing','on');
xlabel('Tiempo [s]');
grid;
axis([0 10 -0.75 0.75])

hold off
legend('x1 = theta1','theta1 medida');
%}

%bode(A, B, C, D);grid;