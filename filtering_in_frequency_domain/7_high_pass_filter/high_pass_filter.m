f=imread('Fig0441(a)(characters_test_pattern).tif');
f=mat2gray(f);
[m,n]=size(f);


%padded
M=2*m;N=2*n;
F=fft2(f,2*m,2*n);

u=0:1:M-1;
idx=find(u>M/2);
v=0:1:N-1;
idy=find(v>N/2);

u(idx)=u(idx)-M;
v(idy)=v(idy)-N;

[V,U]=meshgrid(v,u);

D=hypot(U,V);
H=D*0;

%highpass gaussian filter
D0=0.05*M;
H=1-exp(-(D.^2)./(2*D0^(2)));
% mesh(fftshift(H(1:10:500,1:10:500)))
% axis tight
% figure, imshow(H,[])

G=F.*H;
g=ifft2(G);
imshow(g,[])
imshowpair(f,g(1:m,1:n),'montage');




