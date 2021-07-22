clear;
clc;

% EJERCICIO 4
fprintf('EJERCICIO 4\n');

im=double(imread('dress.jpg'));
figure(1);
imshow(uint8(im));

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
imshow(uint8(blanco));

r=mean2(blanco(:,:,1));
g=mean2(blanco(:,:,2));
b=mean2(blanco(:,:,3));

im(:,:,1)=235*(im(:,:,1)-r)/(255-r)+20;
im(:,:,2)=235*(im(:,:,2)-g)/(255-g)+20;
im(:,:,3)=235*(im(:,:,3)-b)/(255-b)+20;

fprintf('(r,g,b) = %f %f %f\n', r,g,b);

figure(3);
imshow(uint8(im));
