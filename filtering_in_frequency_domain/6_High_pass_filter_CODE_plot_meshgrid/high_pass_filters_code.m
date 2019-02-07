% .M file that computes and shows 3 different types of high pass filters: ideal,
% butterworth and gaussian.

D0=50;% distance from origin point of the meshgrid that acts like a boundary bettwen low and high frequency levels.
n=2;% butterworth filter order.
M=500;% rows number in the filter.
N=500; %columns number in the filter.

%%%%%%%%%%%%%meshgrid%%%%%%%%%%%%%%%

u=0:1:M-1;
idx=find(u>M/2);
v=0:1:N-1;
idy=find(v>N/2);

u(idx)=u(idx)-M;
v(idy)=v(idy)-N;

[V,U]=meshgrid(v,u);

D=hypot(U,V);
H=D*0;
%%
%ideal highpass filter;

for i=1:500;
    for j=1:500;
        if D(i,j)>50
            H(i,j)=1;
        else
            H(i,j)=0;
        end
    end
end

H=fftshift(H);% 
mesh(H(1:10:500,1:10:500))
axis tight
colormap([0 0 0]);
figure, imshow(H,[])

%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% highpass 2º order butterwhorth filter  

H=1./(1+(D0./D).^(2*n));
H=fftshift(H);
mesh(H(1:10:500,1:10:500))
axis tight
figure, imshow(H,[])

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%highpass gaussian filter
% 
H=1-exp(-(D.^2)./(2*D0^(2)));
H=fftshift(H);
mesh(H(1:10:500,1:10:500))
axis tight

figure, imshow(H,[])

