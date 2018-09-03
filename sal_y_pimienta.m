function out = sal_y_pimienta (image, percentage_black, percentage_white)

i = rgb2gray(image);

% Recibido el porcentaje que se desea en la imagen de blancos y negros se
% calcula el valor de b(nergo) tomando como parte completa 255, de igual
% manera se hace para w(blanco). Cada valor ser� empleado para comparar y
% as� aplicar los puntos en cierto pixel o no.
b = 255*percentage_black/100; 
w = 255*percentage_white/100;

% Se conserva la imagen i, por esto se crea una variable img_with_noise que
% contendr� las operaciones que se har�n para obtener el ruido sal pimienta
img_with_noise= i; 

% Se obtiene el tama�o de la imagen
[m,n] = size(i); 

% Generar matriz aleatoria de tama�o mxn que es el tama�o de la imagen. Los
% valores de la matriz est�n distribuidos aleatoriamente en un rango entre
% 0 y 255 que corresponde a las variaciones de color. 
% 0 - negro y 255 - blanco
x = randint(m,n,[0,255]);

% Se hace una comparaci�n entre la imagen img_with_noise y la matriz x
% generada. Si el valor de x es menor al valor calculado b, se hace 0 en la
% imagen img_with_noise. Esto agrega el ruido de pimienta
img_with_noise(x <= b) = 0;  


% Se hace una comparaci�n entre la imagen img_with_noise y la matriz x
% generada. Si el valor de x es menor al valor calculado w, se hace 255 en
% la imagen img_with_noise. Esto agrega el ruido de sal
 img_with_noise(x >=w) = 255;  

% Muestra la imagen obtenida despu�s de haber agregado el ruido
figure(1)
imshow(img_with_noise)
title('Sal y pimienta');

% Usando la funci�n imwrite se puede guardar la imagen final en el formato 
% deseado. En este caso img_with_noise, que contiene todas las operaciones
% hechas, se guardar� como resultadoSyP.jpg
imwrite(img_with_noise, 'resultadoSyP.jpg');
