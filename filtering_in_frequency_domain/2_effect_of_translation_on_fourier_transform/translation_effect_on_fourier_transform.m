
%Effect of Translation on the Fourier Transform.
f=imread('Fig0425(a)(translated_rectangle).tif');
F=fft2(f);
Fc=fftshift(F);
S=abs(Fc);
S2=log(1+abs(Fc));
phi=angle(F);

imshowpair(S2,phi,'montage');



