%Fourier Transform
f=imread('Fig0424(a)(rectangle).tif');
F=fft2(f);
S=abs(F);
imshow(F,[]);
%%
%2 exemplo transformada centralizada;

Fc=fftshift(F);
figure,
imshow(abs(Fc),[]);
%%
%3 exemplo transformacao de intensidade por uma funcao logaritmica(comum
%nesses casos

S2=log(1+abs(Fc));
figure
imshow(S2,[]);
%%
%4 exemplo
%ifftshit(Fc),faz o inverso de fftshift(F);

%calculo de fase com atan2 calcula arco tangente para valores positivos e
%negativos de u e v em F(u,v);

%phi=atan2(I,R)

phi=atan2(imag(F),real(F));

% OU

%phi=angle(Fc);

figure
imshow(phi,[])


