%MAIN SCRIPT
%   Script principal que hace el llamado a las funciones que permiten hacer
%   operaciones en una imagen que se va modificando operación a operación.
%   Se obtiene una cuadrícula que muestra todas las operaciones hechas.
%      
%   Author Emmanuel Lopez Lopez
%   Author Marisol Rodríguez C.
%   CITEDI - Instituto Politénico Nacional
%   Procesamiento Digital de Imágenes
%   $ Date: 2018/09/04 $


close all
clear all
clc

% Se obtiene la imagen con la función imread
i = imread('Imagen_final.png'); 

% Se verficia si la imagen obtenida es de un canal o de 3. En el caso de
% ser de 3 canales hace el cambio empleando la función rgb2gray. En caso de
% no ser así se deja la imagen sin ninguna modificación
if (size(i,3)~=1)
    ii=rgb2gray(i);
else
    ii=i;
end

% j es la guarda la imagen obtenida después de hacer
% submuestreo
j = submuestreo__Funcion(ii,2.5);

% k contiene la imagen después de hacer la rotación de 42 grados. Recibe
% como arguemnto la imagen j y los grados rotar
k = rotacion_funcion(j,42);

% l guardará la salida al aplicar un ruido de sal y pimienta. A la función
% se le pasa como argumento la imagen rotada y el porcentaje deseado de
% blanco y de negro
l = sal_y_pimienta (k, 2, 98);

% m guarda la salida después de haber aplcado un filtro pasa altos, función
% a la cual solo se le pasa como argumento la imagen deseada.
m = pasa_altos (l);


% Se crea una figura que contiene una cuadrícula de 2 por 2. Cada
% cuadrícula está numerada del 1 al 4. Donde el primero será la imagen
% obtenida por el submuestreo, la segunda la rotación, la tercera contendrá
% la imagen con un ruido de sal y pimienta y finalmente la última contendrá
% el filtro pasa altas.
figure(5)
subplot(2,2,1)
imshow(j)
title('Submuestreo de 2.5')

subplot(2,2,2)
imshow(k);
title('Rotacion de 42 grados')

subplot(2,2,3)
imshow(l)
title('Ruido sal y pimienta')

subplot(2,2,4)
imshow(m)
title('Filtro pasa altas')