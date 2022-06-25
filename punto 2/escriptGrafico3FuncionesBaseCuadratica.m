clear
clc
% Creacion del vector x
x=[-10:0.01:10];

%funciones de base radial
sigma = 1;
S= exp(-(x.^2)./2*sigma^2);
S2= sigma^2./(sigma^2+x.^2);
S3= (sigma^2./sqrt(sigma^2+x.^2));

% Grafico de la funcion inversa multicuadrática
title('Funciones de base Radial')
hold on
plot(x,S,'color','g')
plot(x,S2,'color','b')
plot(x,S3,'color','r')

hold off
