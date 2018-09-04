function [ Img_subm ] = submuestreo__Funcion( Img2,subm )
%SUBMUESTREO_FUNCION realiza el submuestreo de una imagen al valor
%ingresado como parámetro.
%   Img2 = imagen a realizar el submuestreo de tipo uint8 de un canal
%   subm = valor de submuestro.
%
%   Img_subm = imagen submuestreada.
%
%   Author Emmanuel Lopez Lopez
%   CITEDI - Instituto Politénico Nacional
%   Procesamiento Digital de Imágenes
%   $Date: 2018/09/03 $


%Se define un arreglo que contiene los tamaños de la matriz
[x,y]=size(Img2)
%Se definen las dimensiones de la matriz resultante, esto mediante el
%redondeo de la division de las dimensiones y el factor de submmuestreo.
a=round(x/subm);
b=round(y/subm);

%Se calcula la relacion entre los nuevos tamaños de la matriz y la matriz
%original, esto con el fin de saber que tanto se va a reducir cada
%dimension de la matriz.
ratio_1=a/x;
ratio_2=b/y;
%En esta seccion se obitenen los valores a interpolar tanto en renglones
%como en columnas, esto se logra mediante la declaracion de un vector que
%tiene como tamaño las dimensiones de la nueva matriz (a,b) que fueron
%definidas lineas anteriores.
%Este vector [1:x*ratio_1] arrojara el resultado: 1  2  4   5...a
%Despues, cada elemento del vector generado se divide entre la relacion de
%dimensiones de la matriz que es la varaible ratio_1, el resultado de esta
%division es el
%vector 2.5  5   7.5   10   12.5  ...a/ratio_1. que son los valores que
%necesitan ser estiamdos mediante interpolacion:
%   |                                         
%   |
%   |                             x
%   |                             |
%   |                             |
%   |             x               |
%   |             |               |
%   |      ?      |       ?
%   |_____|_______|_______|_______|
%        2.5      5       7.5     10
%Despues de esto, se usa la funcion ceil la cual redondea cada valor del
%vector generado al entero mas cercano o en este caso el valor de pixel 
%mas cercano es decir s= 3 6 8 11 13...
Valores_x=round([1:x*ratio_1]/(ratio_1));
Valores_y=round([1:y*ratio_2]/(ratio_2));


%Se declara la matriz de salida Img_subm(obtenida del submuestreo),
%primeramente se recorren todas las filas de la matriz Img2( matrizoriginal)
%Primero se indica que  la nueva matriz corresponderan a las
%columnas de la matriz original segun el indice que indica el vector
%Valores_y .
%Despues se indica que la nueva matriz es los renglones de la nueva matriz
%que corresponden a los valores del vector Valores_y.

Img_subm=Img2(:,Valores_y);
Img_subm=Img_subm(Valores_x,:);

%Se convierte la nueva matriz a uint8 y finalmente se muestra.
uint8(Img_subm);

% Muestra la imagen obtenida después de haber agregado el ruido
figure(1)
imshow(Img_subm)
title('Submuestreo');

% Usando la función imwrite se puede guardar la imagen final en el formato 
% deseado. En este caso Img_subm, que contiene todas las operaciones
% hechas, se guardará como resultadoSubmuestreo.png
imwrite(Img_subm, 'resultadoSubmuestreo.png');

end

