%Fourier Transform of a spacial filter
f=imread('Fig0438(a)(bld_600by600).tif');
[M,N]=size(f);

F=fft2(f,2*M,2*N);
%Sobel filter
h=[-1 0 1; -2 0 2; -1 0 1];
%h=[-1,-2,-1;0,0,0;1,2,1];
   
 H=fft2(h,2*M,2*N);
 imshow(abs(H),[]);
 G=F.*H;
 g=abs(ifft2(G));
 figure,
 imshow(g(1:M,1:N),[])
 
  
 
