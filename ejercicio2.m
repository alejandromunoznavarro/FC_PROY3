clear;
clc;

% EJERCICIO 2
fprintf('EJERCICIO 2\n');

%   PARTE A
N=1000;

im1=randn(N,N);
m1=mean2(im1);
desv1=std2(im1);
fprintf('media (im1) = %f\n',m1);
fprintf('desviacion standard (im1) = %f\n',desv1);

im2=3*randn(N,N);
m2=mean2(im2);
desv2=std2(im2);
fprintf('media (im2) = %f\n',m2);
fprintf('desviacion standard (im2) = %f\n',desv2);

suma=im1+im2;
msum=mean2(suma);
desvsum=std2(suma);
fprintf('media (suma) = %f\n',msum);
fprintf('desviacion standard (suma) = %f\n',desvsum);

resta=im1-im2;
mres=mean2(resta);
desvres=std2(resta);
fprintf('media (resta) = %f\n',mres);
fprintf('desviacion standard (resta) = %f\n',desvres);

media=50;
desv=4;
im1=(im1 - m1)/desv1;
im1=im1*desv + media;

m1=mean2(im1);
desv1=std2(im1);
fprintf('media (im1) = %f\n',m1);
fprintf('desviacion standard (im1) = %f\n',desv1);

suma=im1+im2;
msum=mean2(suma);
desvsum=std2(suma);
fprintf('media (suma) = %f\n',msum);
fprintf('desviacion standard (suma) = %f\n',desvsum);

%   PARTE B
imbi=imread('black.pgm');
R=imbi(1:2:end,1:2:end);
G1=imbi(1:2:end,2:2:end);
G2=imbi(2:2:end,1:2:end);
B=imbi(2:2:end,2:2:end);

figure(4);
hist(double(R(:)),256);

negropuro=128;

%Calculamos la media de los canales
mR=mean2(R);
desvR=std2(R);
fprintf('media (R) = %f\n',mR);
fprintf('desviacion standard (R) = %f\n',desvR);
mG1=mean2(G1);
desvG1=std2(G1);
fprintf('media (G1) = %f\n',mG1);
fprintf('desviacion standard (G1) = %f\n',desvG1);
mG2=mean2(G2);
desvG2=std2(G2);
fprintf('media (G2) = %f\n',mG2);
fprintf('desviacion standard (G2) = %f\n',desvG2);
mB=mean2(B);
desvB=std2(B);
fprintf('media (B) = %f\n',mB);
fprintf('desviacion standard (B) = %f\n',desvB);
