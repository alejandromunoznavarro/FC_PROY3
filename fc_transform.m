function im=fc_transform(im,A)

[n m]=size(A);
if (n~=3)||(m~=3), fprintf('A debe ser matriz 3x3\n'); return; end

[n m q]=size(im);
if (q~=3), fprintf('Necesita imagen color\n'); return; end

im=reshape(im,n*m,3)'; im=double(im);
im=A*im; 
im=reshape(im',n,m,3);
return




