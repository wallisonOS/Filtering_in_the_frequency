
%ringing effect caused by an ideal low-pass filter
f=imread('Fig0441(a)(characters_test_pattern).tif');

[q,w]=size(f);
M=2*q;N=2*w;



%%%%%%%meshgrid%%%%%%%%
u=0:1:M-1;
idx=find(u>M/2);
v=0:1:N-1;
idy=find(v>N/2);

u(idx)=u(idx)-M;
v(idy)=v(idy)-N;

[V,U]=meshgrid(v,u);

D=hypot(U,V);
H=D;
D0=160;% try the values:10,30,60,160,460.

%%%%% Low-Pass filter%%%%%%
for u=1:1:M
    for v=1:1:N
        if D(u,v)<=D0;
            H(u,v)=1;
        else
            H(u,v)=0;
        end
    end
end

    
%% 
 D0=80;
 H=exp(-(D.^2)./(2*(D0^2)));
%%
h=fftshift(ifft2(H));
mesh(h(1:15:end,1:15:end))
shading interp
colormap([0 0 0])
F=fft2(f,M,N);
G=H.*F;

g=ifft2(G);
g=g(1:q,1:w);
figure,
imshowpair(f,g,'montage')
