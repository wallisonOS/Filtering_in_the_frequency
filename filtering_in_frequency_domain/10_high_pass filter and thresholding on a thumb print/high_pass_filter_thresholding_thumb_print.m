%high-pass filter and thresholding on a thumb print.
f=imread('Fig0457(a)(thumb_print).tif');
[M,N]=size(f);
F=fft2(f,2*M,2*N);

%meshgrid


u=0:2*M-1;
v=0:2*N-1;


idu=find(u>M);
idv=find(v>N);

u(idu)=u(idu)-(2*M);
v(idv)=v(idv)-(2*N);

[V,U]=meshgrid(v,u);

D=hypot(U,V);

%filtro butterworth
n=4;
D0=50;
H=1./(1+(D0./D).^(2*n));

%filtering
G=H.*F;
g=ifft2(G);
g=g(1:M,1:N);
gl=g;

%image stretching

for i=1:1:M
    for j=1:1:N
        if gl(i,j)>=0
            gl(i,j)=1;
        else gl(i,j)=0;
        end
    end
end
       
 imshow(g,[]);
 figure,
 imshow(gl,[]);
 

