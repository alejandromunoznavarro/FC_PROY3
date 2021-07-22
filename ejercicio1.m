clear;
clc;
% EJERCICIO 1
fprintf('EJERCICIO 1\n');

im=im2double(imread('color.jpg'));
figure(1);
imshow(uint8(im*255));

%   Seleccionar un punto de la imagen
fprintf('Pincha un punto: ');  
[x,y]=ginput(1); 
fprintf('x=%6.1f,y=%6.1f\n',x,y);
hold on; plot(x,y,'ro','MarkerFaceCol','r','MarkerSize',3); hold off

%   Seleccionamos zona
RAD=20; rg=(-RAD:RAD);

ry=floor(rg+y);
rx=floor(rg+x);
blanco=im(ry,rx,:);
figure(2);
imshow(uint8(blanco*255));

%   Hacemos la media de los colores
r=mean2(blanco(:,:,1));
g=mean2(blanco(:,:,2));
b=mean2(blanco(:,:,3));

%   Calculamos el neutro
neutro=[r,g,b];
fprintf('neutro = %f %f %f\n',r,g,b);

m = mean2(neutro(:));
comp=m./neutro;
fprintf('compensacion = %f %f %f\n',comp);

%   Corregimos
im(:,:,1)=im(:,:,1)*comp(1);
im(:,:,2)=im(:,:,2)*comp(2);
im(:,:,3)=im(:,:,3)*comp(3);
im=uint8(im*255);
figure(3);
imshow(im);
