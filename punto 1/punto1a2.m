clear, clc;
% Creacion del vector x
x=[-10:0.01:10];
% Calculo de la funcion tangente hiperbolica
S=tanh(x);
[val_max,ind]=max(S);%valor maximo de la función, para calcular el 1% de la misma

%Valor correspondiente al 1%, del valor maximo que toma la funcionCalcular el Intevalo de establecimeinto
val= val_max-val_max*0.01; 

%Valor correspondiente al 80%, del valor maximo que toma la funcionCalcular la Velocidad de Creciemiento
val_80= val*0.8

%Uso de "find", para encontrar un valor no entero, utilice un valor de tolerancia
%basado en sus datos.De lo contrario, el resultado es en ocasiones 
%una matriz vacía a consecuencia del error
%de redondeo del punto flotante.
k = find(abs(S-val) < 0.0001);

%Con el valor de "k" se determinan los limites superior e inferior del
%intervalo de establecimiento.
limite_s = x(k)
limite_i= -limite_s

%Se calcula el valor de "k_80" para el 80% de la altura de la curva.
k_80 = find(abs(S-val_80) < 0.002)

%valores de x donde la funcion alcanza el 80% del valor maximo: Velocidad
%de crecimiento
limite_s_80= x(k_80)
limite_i_80= -limite_s_80

% Grafico de la funcion

plot(x,S)
title('Función Tangente Hiperbolica')
hold on
grid

%Dibujo de lineas verticales, para valores de x, donde la funcion
%toma el intervalo de establecimiento
line([limite_s limite_s],[-1 1],'color','g');
text(-5,0.5,strcat('limite superior x=',num2str(limite_s)),'color','g')
line([limite_i limite_i],[-1 1],'color','g');
text(2.7,0.5,strcat('limite inferior x=',num2str(limite_i)),'color','g')

%Dibujo linea varticales, para valores de x, donde la funcion
%alcanza el 80% del valor maximo
line([limite_s_80 limite_s_80],[-1 1],'color','r')
line([limite_i_80 limite_i_80],[-1 1],'color','r')
text(-2,-0.7,strcat('velocidad de crecimiento x=',num2str(limite_i_80),' y x=',num2str(limite_s_80)),'color','r')
hold off

disp('******')
disp('*   x  *  y  *')
disp('************')
disp(strcat('*  ',num2str(limite_s),' *  ',num2str(val),'*'))
disp('************')
disp(strcat('*  ',num2str(limite_s_80),' *  ',num2str(val_80),'*'))
disp('************')
