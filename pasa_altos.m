function [out] = pasa_altos (image)
%PASA_ALTOS realiza un filtro pasa altos a una imagen
%   image = imagen a tratar con el filtro pasa altos.
%
%   out = matriz con el resultado depués de haber aplicado el filtro pasa
%   altos
%
%   Author Marisol Rodríguez C.
%   CITEDI - Instituto Politénico Nacional
%   Procesamiento Digital de Imágenes
%   $Date: 2018/09/03 $

i = image;

% Pasar la imagen uint8 a formato double para poder hacer las operaciones.
% Se divide entre 255, valor que corresponde a la cantidad de colores
% presentes en la imagen del 1 al 255
a = double(i)./255;

% m y n guardan el tamaño de la imagen a
[m,n] = size(a);

% h es la matriz que hará de máscara pasa alto estricto (elimina la
% componente continua). La suma de sus cofecientes es 0 
h = [-1 -1 -1; -1 8 -1; -1  -1 -1];

% Recorre la imagen y la máscara. La máscara va operando la imagen parte por
% parte, la cual se va suamando a la matriz b que devolverá la imagen
% filtrada
for i=2:m-1
    for j=2:n-1
        b(i,j)=h(1,1).*a(i-1,j-1)+h(1,2).*a(i-1,j)+h(1,3).*a(i-1,j+1)+h(2,1).*a(i,j-1)+h(2,2).*a(i,j)+h(2,3).*a(i,j+1)+h(3,1).*a(i,j-1)+h(3,2).*a(i+1,j)+h(3,3).*a(i+1,j+1);
    end
end

% Muestra la imagen obtenida después de haber agregado el ruido
figure(4)
imshow(b)
title('Pasa altos');

% Usando la función imwrite se puede guardar la imagen final en el formato 
% deseado. En este caso b, que contiene todas las operaciones
% hechas, se guardará como resultadoPasaAltos.png
imwrite(b, 'resultadoPasaAltos.png');

out = b;

end
   