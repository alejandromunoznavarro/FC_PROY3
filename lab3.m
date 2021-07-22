
%   EJERCICIO 3
fprintf('EJERCICIO 3\n');

load ruido;
E=zeros(11,1);
S=zeros(11,1);

for k=1:11
    frame=ruido(:,:,k);
    E(k)=mean2(frame)-128;
    S(k)=std2(frame);
end

figure(5);
hold on; plot(E,S,'rs');

H=[E.^0 E E.^2];
c=H\(S.^2);
e=(0:4000);
s=sqrt(c(1)+c(2)*e+c(3)*e.^2);
hold on; plot(e,s,'b'); hold off
fprintf('desvlectura=%f\n', sqrt(c(1)));
G=c(2);
fprintf('G=%f\n', G);
E=E/G;
S=S/G;
figure(6);
hold on; plot(E,S,'rs'); hold off

c3=sqrt(c(3));
fprintf('constante=%f\n', c3*100);
