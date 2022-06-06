function dx = sistema_rotacional(t,x)

k1=2.7114;
k2=k1;
j1=0.009;
j2=j1;
b1=0.02;
b2=b1;

if t<4
    tau=0.5;
else
    tau=0;
end

dx=[
    x(2);
    (tau - b2*x(2)-k1*(x(1)-x(3)))/j1;
    x(4);
    (-b1*x(4)+ k1 *(x(1)-x(3))- k2 * x(3))/j2
];
