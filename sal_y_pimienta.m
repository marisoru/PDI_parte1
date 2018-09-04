function [out] = sal_y_pimienta (image, percentage_black, percentage_white)
%SAL_Y_PIMIENTA aplica ruido de tipo sal y pimienta de manera aletaroria y
%uniforme a toda la imagen.
%   image = imagen a realizar el ruido sal y pimienta
%   percentage_black = valor en porcentaje de negro a aplicar en la imagen
%   percentage_white = valor en porcentaje de blanco a aplicar en la imagen
%
%   out = imagen con el ruido sal y pimienta.
%
%   Author Marisol Rodríguez C.
%   CITEDI - Instituto Politénico Nacional
%   Procesamiento Digital de Imágenes
%   $Date: 2018/09/03 $

i = image;

% Recibido el porcentaje que se desea en la imagen de blancos y negros se
% calcula el valor de b(nergo) tomando como parte completa 255, de igual
% manera se hace para w(blanco). Cada valor será empleado para comparar y
% así aplicar los puntos en cierto pixel o no.
b = 255*percentage_black/100; 
w = 255*percentage_white/100;

% Se conserva la imagen i, por esto se crea una variable img_with_noise que
% contendrá las operaciones que se harán para obtener el ruido sal pimienta
img_with_noise= i; 

% Se obtiene el tamaño de la imagen
[m,n] = size(i); 

% Generar matriz aleatoria de tamaño mxn que es el tamaño de la imagen. Los
% valores de la matriz están distribuidos aleatoriamente en un rango entre
% 0 y 255 que corresponde a las variaciones de color. 
% 0 - negro y 255 - blanco
x = floor(rand(m, n) * (255));

% Se hace una comparación entre la imagen img_with_noise y la matriz x
% generada. Si el valor de x es menor al valor calculado b, se hace 0 en la
% imagen img_with_noise. Esto agrega el ruido de pimienta
img_with_noise(x <= b) = 0;  


% Se hace una comparación entre la imagen img_with_noise y la matriz x
% generada. Si el valor de x es menor al valor calculado w, se hace 255 en
% la imagen img_with_noise. Esto agrega el ruido de sal
 img_with_noise(x >=w) = 255;  

% Muestra la imagen obtenida después de haber agregado el ruido
figure(3)
imshow(img_with_noise)
title('Sal y pimienta');

% Usando la función imwrite se puede guardar la imagen final en el formato 
% deseado. En este caso img_with_noise, que contiene todas las operaciones
% hechas, se guardará como resultadoSalyPimienta.jpg
imwrite(img_with_noise, 'resultadoSalyPimienta.png');

out = img_with_noise;
end
