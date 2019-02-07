% Gaussian filter smothing effect 
f=imread('Fig0450(a)(woman_original).tif');

[q,w]=size(f);

%padded image size
M=2*q;
N=2*w;



%%%%%%% Meshgrid%%%%%%%%
u=0:1:M-1;
idx=find(u>M/2);
v=0:1:N-1;
idy=find(v>N/2);

u(idx)=u(idx)-M;
v(idy)=v(idy)-N;

[V,U]=meshgrid(v,u);

D=hypot(U,V);

%%%%%% Low-Pass Filter%%%%%%
D0=80;
H=exp(-(D.^2)./(2*(D0^2)));
F=fft2(f,M,N);
G=H.*F;

g=ifft2(G);
g=g(1:q,1:w);
imshowpair(f,g,'montage')
