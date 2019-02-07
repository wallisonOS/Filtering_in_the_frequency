%using notch filters to reduce moiré patterns.

f=imread('Fig0464(a)(car_75DPI_Moire).tif');
[M,N]=size(f);

F=fft2(f);

S=log(1+abs(F));
S=fftshift(S);
imtool(S,[])


%meshsgrid
u=0:M-1;
v=0:N-1;



idx=find(u>M/2);
idy=find(v>N/2);



u(idx)=u(idx)-M;
v(idy)=v(idy)-N;

[V,U]=meshgrid(v,u);

D=hypot(U,V);

%filter

D0=20;
n=1;


D1=hypot(U-40,V-29);
D2=hypot(U+40,V+29);

D3=hypot(U-42,V+27);
D4=hypot(U+42,V-27);

D5=hypot(U+81,V+30);
D6=hypot(U-81,V-30);

D7=hypot(U+82,V-28);
D8=hypot(U-82,V+28);

H1=(1./(1+(D0./D1).^(2*n))).*(1./(1+(D0./D2).^(2*n)));
  
H2=(1./(1+(D0./D3).^(2*n))).*(1./(1+(D0./D4).^(2*n)));
 
H3=(1./(1+(D0./D5).^(2*n))).*(1./(1+(D0./D6).^(2*n)));

H4=(1./(1+(D0./D7).^(2*n))).*(1./(1+(D0./D8).^(2*n)));



H=H1.*H2.*H3.*H4;

G=F.*H;
S2=log(1+abs(G));
S2=fftshift(S2);
imtool(S2,[])


g=ifft2(G);
g=abs(g(1:M,1:N));
g=mat2gray(g);
imshow(g,[])
figure;imshow(f,[]);

