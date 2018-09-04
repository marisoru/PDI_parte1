function [ Img_salida ] = rotacion_funcion( Img,grados )
%ROTACION_FUNCION realiza la rotación de una imagen
%   Img = imagen a rotar
%   grados = valor de la rotacion en grados
%
%   Img_salida = imagen rotada
%
%   Author Emmanuel Lopez Lopez
%   CITEDI - Instituto Politénico Nacional
%   Procesamiento Digital de Imágenes
%   $Date: 2018/09/03 $


%Se calcula el centro de la imagen.

    centro_x = ceil((size(Img,1))/2);
    centro_y = ceil((size(Img,2))/2);
%En este caso, hay que aplicar una transformacion a las coordenadas de la
%matriz, por eso, en el paso siguiente mediante la funcion meshgrid se
%declaran los valores y,x.

[y,x] = meshgrid(1:size(Img,2), 1:size(Img,1));
%Se tranforman las coordenadas obtenidas a coordenadas polares declarando
%los valores:
%[t(theta),r(rho)]
%Es necesario pasar como argumento la diferencia entre el centro de la
%matriz y el resto de las coordenas, esto posicionara el origen del centro
%de coordenadas en el centro de la imagen y no el origen de esta.
[t,r] = cart2pol(x-centro_x,y-centro_y);

%Dado que solamente se realizara una rotacion es decir a theta(t) se le va
%a sumar el valor de rotacion de deseado, para ello se convierten los
%valores de t de radianes a grados y simplemente se le suma el valor
%"grados" que para este caso tiene como valor 42 grados.
t1 = radtodeg(t)+grados;

%se convirten los valores de t1 a radianes.
t = degtorad(t1);

%se tranforma ahora de coordenadas polares a coordenadas cartesianas ya con
%el valor de theta trasladado.
[x,y] = pol2cart(t,r);

%Se suman los puntos centrales a los valores x,y
tempx = round(x+centro_x);
tempy = round(y+centro_y);

%Para asegurar que las coordenadas sean enteras positivas, se verifica que
%las coordenadas esten dentro del area de la imagen, primer se buscan los
%numero negativos recorriendo las matrices tempx y tempy, en caso de
%existir el numero negativo, a las matrices tempx y tempy se le define 
%como la
%suma de ese vector con el valor absoluto se su elemente minimo.
if ( min(tempx(:)) < 0 )   
tempx = tempx+abs(min(tempx(:)));
end

if( min(tempy( : )) < 0 )
tempy = tempy+abs(min(tempy(:)));
end
%despues, todos los valores que sean 0, se sustituyen por un uno.
tempy(tempy==0) = 1;
tempx(tempx==0) = 1;
%Se declara la matriz Img_rota con las dimensiones de la matriz original
Img_rota = uint8(zeros([size(Img,1) size(Img,2)]));

%La matriz Img_adquiere los valores de la matriz original, solamente que
%los coloca en las coordenadas que indican las matricex tempx y tempy.
for i = 1:size(Img,1)
    for j = 1:size(Img,2)
        Img_rota(tempx(i,j),tempy(i,j)) = Img(i,j);   
    end
  
end



Img_rotada = Img_rota;

%llenado de huecos
for i = 2:size(Img_rota,1)-1
    for j = 2:size(Img_rota,2)-1
       
        temp = Img_rota(i-1:i+1,j-1:j+1);
        if(temp(5)==0&&sum(temp(:))~=0)
            pt = find(temp~=0);
           
            [~,pos] = sort(abs(pt-5));
            Img_rotada(i,j) = temp(pt(pos(1)));
          
        end
       
    end
end
%Recuperar tamaño de la imagen original se hace un "crop" a la imagen
%resultante calculando los pixeles de donde se tomaran los valores de la
%nueva matriz
Img_salida=zeros(size(Img));
offsetx=round(((size(Img_rotada,2))-(size(Img_salida,2)))/2);
offsety=round(((size(Img_rotada,1))-(size(Img_salida,1)))/2);
for i=1:size(Img,1)
    for j=1:size(Img,2)
        Img_salida(i,j)=uint8(Img_rotada(i+offsety,j+offsetx));
    end
end
Img_salida=uint8(Img_salida);

% Muestra la imagen obtenida después de haber agregado el ruido
figure(2)
imshow(Img_salida)
title('rotacion');

% Usando la función imwrite se puede guardar la imagen final en el formato 
% deseado. En este caso Img_salida, que contiene todas las operaciones
% hechas, se guardará como resultadoRotacion.png
imwrite(Img_salida, 'resultadoRotacion.png');

end

