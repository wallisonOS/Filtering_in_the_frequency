f=imread('Fig0333(a)(test_pattern_blurring_orig).tif');
[M,N]=size(f);

 
% %padding
% 
% fp=zeros(2*M,2*N);
% fp(1:M,1:N)=f;
% fp=mat2gray(fp);
% %[X,Y]=mashgrid([0:2*M],[0:2*N]);

u=0:2*(M-1)+1;
idx=find(u>M);

v=0:2*(N-1)+1;
idy=find(v>N);

u(idx)=u(idx)-2*M;
v(idy)=v(idy)-2*N;

[V,U]=meshgrid(v,u);

D=hypot(U,V);

%threshold
D0=0.05*2*M;
F=fft2(f,2*M,2*N);
%Gaussian Low-Pass filter
H=exp(-(D.^2)/(2*(D0^2)));
%filtering
G=F.*H;
g=ifft2(G);
g=g(1:M,1:N);


imshowpair(f,g,'montage')
figure,imshow(fftshift(H));
figure,imshow(log(1+abs(fftshift(F))),[]);
figure,imshow(log(1+abs(fftshift(G))),[]);





