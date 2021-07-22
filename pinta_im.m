function pinta_im(im0,name)

  set(gcf,'Name',name);
  
  im0=uint8(im0*255);
  image(im0); fc_truesize
  if ndims(im0)<3, colormap(gray(256)); end
  e=gca;
  
  p=get(gca,'Pos');
  A=0.15; axes('Pos',[p(1)+p(3)-1.07*A p(2)+p(4)-1.1*A A A]);
  fc_imhist(im0);
   
 %axes(e);  

return

function fc_truesize

% Control de que existe figura, ejes, imagen
fig=findobj('type','figure'); if isempty(fig), return; end; 
fig=gcf; %fig(1); 

eje=findobj(fig,'type','axes'); if isempty(eje), return; end;
set(eje,'Units','Norm');

h_im = findobj(eje,'type','image');
if isempty(h_im), return; end


dim_im=[size(get(h_im,'Cdata'),2) size(get(h_im,'Cdata'),1)];
pos_f = get(gcf,'Pos'); dim_fig = pos_f(3:4);

set(gca,'Pos',[0.0 0.0 1 1]); % Ejes cubriendo fig
pos_eje=get(gca,'Pos'); 
dim_eje=pos_eje(3:4).*dim_fig;

factor = dim_im./dim_eje;
new_dim_fig = round(dim_fig.*factor);

%qq=get(eje,'Pos');qq=qq(3:4).*

% Falta control de imagen muy grande.
screen=get(0,'ScreenSize'); screen=screen(3:4);

ratio=(new_dim_fig./screen);
M=max(ratio)+0.10;

if M>1,
   K = floor(20/M)/20;
   new_dim_fig =  new_dim_fig*K;
   fprintf('WARNING: Screen size %d x %d. Imagen reducida al %.0f%%\n',screen,K*100);
end    

% Centrar figura

pos_f(1) = (screen(1)-new_dim_fig(1)  )/2;
pos_f(2) = (screen(2)-new_dim_fig(2)-50  )/2;
set(gcf,'Pos',[pos_f(1:2) new_dim_fig]);


%set(gca,'Units','Pixels'); get(gca,'Pos'); set(gca,'Units','Norm');

return


function [h x]=fc_imhist(im,N)

if nargin==1, N=256; end

is_uint8=strcmp(class(im),'uint8'); % Check if input is uint8 class

if is_uint8, 
    x=(0:N-1)*255/(N-1); im=double(im);
else
    MM=max(max(im(:,:,1)));
    x=MM*(0:N-1)/(N-1); 
end

if size(im,3)==1,
  h = histc(im(:),x);
  
  if nargout==0,
    g=[1 1 1]*0.4;  
    stem(x,h,'k','Marker','none'); 
    %set(bb,'EdgeColor',g,'FaceColor',g);
    set(gca,'Ytick',[],'XColor',[1 1 1],'Xtick',(0:64:256));
  end  
else 
  h=zeros(N,3);
  
  for k=1:3,
    h(:,k) = histc(reshape(im(:,:,k),1,size(im,1)*size(im,2)),x);      
  end    

  if nargout==0,   
    stem(x,h(:,1),'r','Marker','none'); hold on;
    stem(x+0.33,h(:,2),'g','Marker','none');
    stem(x+0.67,h(:,3),'b','Marker','none');
    hold off
    set(gca,'Ytick',[],'XColor',[1 1 1],'Xtick',(0:64:256));
  end 
  
  
end    
  
  set(gca,'Xlim',[x(1)-5 x(end)+5]);

return














