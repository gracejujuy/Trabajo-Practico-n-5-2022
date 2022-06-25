clear
clc
% Creacion del vector x
x=[-10:0.01:10];

%Variaci�n de Sigma y Calculo de la funcion inversa multicuadr�tica
sigma = 1;
S= (sigma^2./sqrt(sigma^2+x.^2));

sigma= 0.5;
S2= (sigma^2./sqrt(sigma^2+x.^2));

sigma= 1.5;
S3=(sigma^2./sqrt(sigma^2+x.^2));

sigma=2;
S4=(sigma^2./sqrt(sigma^2+x.^2));

sigma=2.5;
S5=(sigma^2./sqrt(sigma^2+x.^2));

sigma=3;
S6=(sigma^2./sqrt(sigma^2+x.^2));

[val,ind]=max(S)%valor maximo de la funci�n, para calcular el 1% de la misma

% valor correspondiente al 1%, del valor maximo que toma la funcion
val_1= val*0.01


%Para encontrar un valor no entero, utilice un valor de tolerancia basado 
%en sus datos.De lo contrario, el resultado es en ocasiones una matriz 
%vac�a a consecuencia del error de redondeo del punto flotante.
k = find(abs(S-val_1) < 0.09)

%Intevalo de establecimeinto
limite_i = x(k(1))
limite_s= -limite_i

% Grafico de la funcion inversa multicuadr�tica
title('Funci�n inversa multicuadr�tica')
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
text(6,0.5,strcat('Limite Superior x= ',num2str(limite_s)),'color','k')
line([limite_i limite_i],[0 1],'color','k')
text(-9,0.5,strcat('Limite Inferior x= ',num2str(limite_i)),'color','k')

hold off
