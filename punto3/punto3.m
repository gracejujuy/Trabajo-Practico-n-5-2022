clc, clear;

%Patron de aprendizaje y objetivo
P = [0 0 1 1;
     0 1 0 1];
 T = [-1 1 1 -1];
 Q = 4;
 
 n1 = 30;%nummero de neuronas en la capa oculta
 ep = 1;%ventana de valores iniciales
 
 %Valores iniciales
 W1 = ep*(2*rand(n1,2)-1);
 b1 = ep*(2*rand(n1,1)-1);
 W2 = ep*(2*rand(1,n1)-1);
 b2 = ep*(2*rand-1);
 alfa = 0.001;
 
 for epocas = 1:10000 %ciclos de ejecucion
     sum = 0;
     for q = 1:Q %donde Q=4 por el numero de entradas
         %propagacion de la entrada hacia la salida
         a1 = tansig(W1*P(:,q)+b1);
         a2(q) = tansig(W2*a1+b2);
         
         %retropropagacion de la sensibilidades
         e = T(q)-a2(q);
         s2 = -2*(1-a2(q)^2)*e;
         s1 = diag(1-a1.^2)*W2'*s2;
         
         %actualizacion de pesos sinapticos y polarizaciones
         W2 = W2 - alfa*s2*a1'; %
         b2 = b2 - alfa*s2;
         W1 = W1 - alfa*s1*P(:,q)';
         b1 = b1 - alfa*s1;
         
         %sumando el error cuadratico
         sum = e^2 + sum;
     end
     
     %error cuadratico medio
     emedio(epocas) = sum/Q;
 end
 subplot(1,2,1) %crea una matriz de 1*2 que divide la pantalla de grafico
 %para poder mostrar 2 ventanas en paralelo. Esta se ubuca en 1
 axis([0 10000 0 1.8]) %control de escala sobre los ejes X e Y
 plot(emedio)
 title('Error Cuadratico Medio')
 grid
 
 %verificacion de la respuesta de la multicapa
 for q = 1:Q
     a(q) = tansig(W2*tansig(W1*P(:,q)+ b1)+ b2);
 end
 a
 
%Frontera de decision
u = linspace(-2, 2, 100); %genera un vector espaciado de 2, desde -2 a 100
v = linspace(-2, 2, 100); %genera un vector espaciado de 2, desde -2 a 100
for i = 1:length(u)
     for j = 1:length(v)
         z(i,j) = tansig(W2*tansig(W1*[u(i); v(j)] + b1) +b2);
     end
 end
 subplot(1,2,2)%crea una matriz de 1*2 que divide la pantalla de grafico
 %para poder mostrar 2 ventanas en paralelo. Esta se ubica en 2.
 hold on
 contour(u,v,z',[-0.9, 0, 0.9],'LineWidth',2)
 axis([-0.5 1.5 -0.5 1.5]) %control de escala sobre los ejes X e Y
 plot(P(1,[1,4]),P(2,[1,4]),'ro',P(1,[2,3]),P(2,[2,3]),'bo')
 title('Frontera de Desicion')
 grid
