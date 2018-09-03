% main script

close all
clear all
clc

i = imread('imagen2.jpg'); 
sal_y_pimienta (i, 1.6, 98.4);
j = imread('resultadoSyP.jpg'); 
pasa_altos (j)