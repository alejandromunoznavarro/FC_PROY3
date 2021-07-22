clear;
clc;

% EJERCICIO 5
fprintf('EJERCICIO 5\n');

%   A. Preparacion y escalado de los datos
fprintf('A. Preparacion y escalado de los datos\n');
im=double(imread('raw.pgm'));
min=128;
max=4095;
im=(im - min)/(max - min);
figure(1);
pinta_im(im,'RAW');

%   B. Demultiplexado
fprintf('B. Demultiplexado\n');
R=im(1:2:end,1:2:end);
G1=im(1:2:end,2:2:end);
G2=im(2:2:end,1:2:end);
B=im(2:2:end,2:2:end);
G=(G1+G2)/2;
im=cat(3,R,G,B);
figure(2);
pinta_im(im,'RGB');

%   C. Equilibrado de color automatico
fprintf('C. Equilibrado de color automatico\n');
neutro=[mean2(R),mean2(G),mean2(B)];
fprintf('neutro = %f %f %f\n',neutro(1),neutro(2),neutro(3));
m = mean2(neutro(:));
comp=m./neutro;
fprintf('compensacion = %f %f %f\n',comp);
im(:,:,1)=im(:,:,1)*comp(1);
im(:,:,2)=im(:,:,2)*comp(2);
im(:,:,3)=im(:,:,3)*comp(3);
figure(3);
pinta_im(im,'Balance blancos');

%   D. Paso a espacio de color sRGB
%      y aplicacion de la no linealidad
fprintf('D. Paso a espacio de color sRGB y no linealidad\n');
M = [1.645 -0.610 -0.035 ; 0.014 1.270 -0.284 ; 0.006 -0.207 1.201];
im = fc_transform(im,M);
y=2.4;
for k=1:size(im,1)
    for j=1:size(im,2)
        for i=1:3
            if(im(k,j,i)<0)
                im(k,j,i)=0;
            elseif(im(k,j,i)>1)
                im(k,j,i)=1;
            end
            if(im(k,j,i)<0.0031308)
               im(k,j,i)=12.92*im(k,j,i);
            else
                im(k,j,i)=1.055*(im(k,j,i)^(1/y))-0.055;
            end
        end
    end
end
figure(4);
pinta_im(im,'sRGB + GAMMA');


%   E. Retoques de Brillo/Contraste/Saturacion
fprintf('E. Retoques de Brillo/Contraste/Saturacion\n');
im=rgb2hsv(im);
p=0.5;
im(:,:,3)=(im(:,:,3).^3).*(1-3*(im(:,:,3)-1)+6*(im(:,:,3)-1).^2);
im(:,:,2)=im(:,:,2).^p;
im=hsv2rgb(im);
figure(5);
pinta_im(im,'Saturacion y brillo');

%   F. Almacenamiento
fprintf('F. Almacenamiento\n');

im = uint8(im*255);
whos im;
imwrite(im,'foto.tif');
imwrite(im,'foto99.jpg','Quality',99);
imwrite(im,'foto95.jpg','Quality',95);
imwrite(im,'foto80.jpg','Quality',80);
r99 = 1-1153877/4610160;
r95 = 1-609484/4610160;
r80 = 1-252261/4610160;
fprintf('r99 = %f\n',r99*100);
fprintf('r95 = %f\n',r95*100);
fprintf('r80 = %f\n',r80*100);