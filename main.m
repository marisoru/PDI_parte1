%MAIN SCRIPT
%   Script principal que hace el llamado a las funciones que permiten hacer
%   operaciones en una imagen que se va modificando operaci�n a operaci�n.
%   Se obtiene una cuadr�cula que muestra todas las operaciones hechas.
%      
%   Author Emmanuel Lopez Lopez
%   Author Marisol Rodr�guez C.
%   CITEDI - Instituto Polit�nico Nacional
%   Procesamiento Digital de Im�genes
%   $ Date: 2018/09/04 $


close all
clear all
clc

% Se obtiene la imagen con la funci�n imread
i = imread('Imagen_final.png'); 

% Se verficia si la imagen obtenida es de un canal o de 3. En el caso de
% ser de 3 canales hace el cambio empleando la funci�n rgb2gray. En caso de
% no ser as� se deja la imagen sin ninguna modificaci�n
if (size(i,3)~=1)
    ii=rgb2gray(i);
else
    ii=i;
end

% j es la guarda la imagen obtenida despu�s de hacer
% submuestreo
j = submuestreo__Funcion(ii,2.5);

% k contiene la imagen despu�s de hacer la rotaci�n de 42 grados. Recibe
% como arguemnto la imagen j y los grados rotar
k = rotacion_funcion(j,42);

% l guardar� la salida al aplicar un ruido de sal y pimienta. A la funci�n
% se le pasa como argumento la imagen rotada y el porcentaje deseado de
% blanco y de negro
l = sal_y_pimienta (k, 2, 98);

% m guarda la salida despu�s de haber aplcado un filtro pasa altos, funci�n
% a la cual solo se le pasa como argumento la imagen deseada.
m = pasa_altos (l);


% Se crea una figura que contiene una cuadr�cula de 2 por 2. Cada
% cuadr�cula est� numerada del 1 al 4. Donde el primero ser� la imagen
% obtenida por el submuestreo, la segunda la rotaci�n, la tercera contendr�
% la imagen con un ruido de sal y pimienta y finalmente la �ltima contendr�
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