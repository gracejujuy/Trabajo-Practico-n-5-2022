clear
clc
% Creacion del vector x
x=[-10:0.01:10];

%Variación de Sigma y Calculo de la funcion Gaussiana
sigma = 1;
S= exp(-(x.^2)./2*sigma^2);

sigma= 0.5;
S2= exp(-(x.^2)./2*sigma^2);

sigma= 1.5;
S3=exp(-(x.^2)./2*sigma^2);

sigma=2;
S4=exp(-(x.^2)./2*sigma^2);

sigma=2.5;
S5=exp(-(x.^2)./2*sigma^2);

sigma=3;
S6=exp(-(x.^2)./2*sigma^2);

[val,ind]=max(S)%valor maximo de la función, para calcular el 1% de la misma

% valor correspondiente al 1%, del valor maximo que toma la funcion
val_1= val*0.01; 


%Para encontrar un valor no entero, utilice un valor de tolerancia basado 
%en sus datos.De lo contrario, el resultado es en ocasiones una matriz 
%vacía a consecuencia del error de redondeo del punto flotante.
k = find(abs(S-val_1) < 0.0003)

%Intevalo de establecimeinto
limite_s = x(k(1))
limite_i= -limite_s

% Grafico de la funcion Gaussiana
title('Función Gaussiana')
hold on
plot(x,S2,'color','y')
plot(x,S,'color','b')
plot(x,S3,'color','r')
plot(x,S4,'color','g')
plot(x,S5,'color','m')
plot(x,S6,'color','k')
grid

%Dibujo de lineas verticales, para valores de x, donde la funcion
%toma el intervalo de establecimiento
line([limite_s limite_s],[0 1],'color','k')
text(6,0.5,strcat('Limite Superior x=',num2str(limite_s)),'color','k')
line([limite_i limite_i],[0 1],'color','k')
text(-9,0.5,strcat('Limite Inferior x=',num2str(limite_i)),'color','k')
hold off
