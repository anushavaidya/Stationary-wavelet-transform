clear all;
global x1 
x1 = zeros(1000,1);
global x2
x2 = zeros(1000,1);
global z1
z1 = zeros(1000,1);
global z2
z2= zeros(1000,1);
global temp
temp= zeros(1000,1);
global delay 
delay = 5;
global filter_taps 
filter_taps= 9;

% Read the image%
Y = imread("lena512noisy.bmp");
[rows,columns,channels] = size(Y);
Y = im2double(Y);
G = imread("lena512.bmp");

global h1
global h2
global g1 
global g2
% Filter co-efficients %
h1 = [0.026749 , -0.016864, -0.078223, 0.266864, 0.602949, 0.266864, -0.078223, -0.016864, 0.026749];
h2 = [0.0, -0.045636, -0.028772, 0.295636, 0.557543, 0.295636, -0.028772, -0.045636, 0.0];

g1 = [0.0,-0.045636,0.028772,0.295636,-0.557543,0.295636,0.028772, -0.045636,0.0];
g2 = [-0.026749,-0.016864,0.078223,0.266864,-0.602949,0.266864,0.078223,-0.016864,-0.026749];

for n= 1:9
    h1(n) = h1(n)*sqrt(2.0);
    h2(n) = h2(n)*sqrt(2.0);
    g1(n) = g1(n)*sqrt(2.0);
    g2(n) = g2(n)*sqrt(2.0);
end

%---------------------DECOMPOSITION and RECONSTRUCTION OF 22 BAND MODIFIED PYRAMID AND 16 -BAND DYADIC PYRAMID---------------------------------------------
Z = decomp(Y);

% -------------setting three highest frequency to zero---------
Z3 = Z;
Z3(rows*3/4:rows, columns/2:columns) =0;
Z3(rows/2:rows*3/4,columns*3/4:columns)=0;
%imshow(Z3);
A1 = recon(Z3);
figure(1);
imshow(A1);
title(' reconstruction of 3rd highest modified pyramid');
grid on;
%imshow(A1);
img1 = fft2(double(A1));
img1 = fftshift(img1);
figure(2);
imshow(log(abs(img1)),[]);
title("magnitude spectrum of 3rd highest modified pyramid");
grid on;


% -------------setting 10th highest frequency to zero-----------
Z10 = Z;
Z10(rows/2:rows,:)=0;
Z10(rows/4:rows/2,columns/2:columns)=0;
A2 = recon(Z10);
figure(3);
imshow(A2);
title('reconstruction of 10th highest modified pyramid');
grid on;
%imshow(A1);
img2 = fft2(double(A2));
img2 = fftshift(img2);
figure(4);
imshow(log(abs(img2)),[]);
title("magnitude spectrum of 10th highest modified pyramid");
grid on;

% % --------- setting 15th highest frequency to zero------------
Z15 = Z;
%Z15(rows/4:rows, :) = 0;
%Z15(1:rows/4,columns/4:columns)=0;
A3 = recon(Z15);
figure(5);
imshow(A3);
title('reconstruction of 15th highest modified pyramid');
grid on;
%imshow(A1);
img3 = fft2(double(A3));
img3 = fftshift(img3);
figure(6);
imshow(log(abs(img3)),[]);
title("magnitude spectrum of 15th highest modified pyramid");
grid on;



%------ 16 band dyadic pyramid-----------
E = dyd_pyramid(Y);

%----- setting 3rd highest frequency to zero-----------
C1 = E;
C1(rows/2:rows,:)=0;
C1(:,columns/2:columns)=0;
D1 = pyd_recon(C1);
figure(7);
imshow(D1);
title('reconstruction of 3rd highest dyadic pyramid');
grid on;
%imshow(A1);
img4 = fft2(double(D1));
img4 = fftshift(img4);
figure(8);
imshow(log(abs(im2double(img4))),[]);
title("magnitude spectrum of 6th highest dyadic pyramid");
grid on;

%------ setting the highest frequency to zero-----------
C2 = E;
C2(rows/2:rows,columns/2:columns) =0;
D2 = pyd_recon(C2);
figure(9);
imshow(D2);
title('reconstruction of  highest dyadic pyramid');
grid on;
%imshow(A1);
img5 = fft2(double(D2));
img5 = fftshift(img5);
figure(10);
imshow(log(abs(img5)),[]);
title("magnitude spectrum of highest dyadic pyramid");
grid on;


%-------- setting 6th highest frequency to zero----------
C3 = E;

C3(rows/4:rows,:)=0;
C3(:,columns/4:columns)=0;
D3 = pyd_recon(C3);
figure(11);
imshow(D3);
title('reconstruction of 6th highest dyadic pyramid');
grid on;
%imshow(A1);
img6 = fft2(double(D3));
img6 = fftshift(img6);
figure(12);
imshow(log(abs(img6)),[]);
title("magnitude spectrum of 6th highest dyadic pyramid");
grid on;




%------- ORIGINAL IMAGE-----------------
img_or = fft2(double(G));
img_or = fftshift(img_or);
figure(13);
imshow(G);
title('original lena image');
figure(14);
imshow(log(abs(img_or)),[]);
title(" magnitude spectrum of original image");
grid on;



