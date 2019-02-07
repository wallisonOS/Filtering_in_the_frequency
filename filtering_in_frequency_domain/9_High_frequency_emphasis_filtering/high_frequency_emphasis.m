%exemplo 4.19 high frequency emphasis
f=imread('Fig0459(a)(orig_chest_xray).tif');
f=mat2gray(f);
[r,s]=size(f);
%defining the dimensions of the padded array;
M=2*r;
N=2*s;

F=fft2(f,M,N);

D0=0.05*M;%threashold is set as 5% of the width of the padded image.
n=2;

% Defining the meshgrid used to evaluate the filter function based on the
% distance between the frequency to the value of frequency (0,0)
u=0:1:M-1;
idx=find(u>M/2);

v=0:1:N-1;
idy=find(v>N/2);

u(idx)=u(idx)-M;
v(idy)=v(idy)-N;

[V,U]=meshgrid(v,u);

D=hypot(U,V);
H=D*0;

%highpass 2º order butterwhorth filter  

 H=1./(1+(D0./D).^(2*n));
 Hfe=0.5+2*H;

G=F.*Hfe;% filtering
g=abs(ifft2(G));%spectrum
g=g(1:r,1:s);

 g=histeq(g,256);% histogram equalization function
 imshowpair(f,g,'montage')


