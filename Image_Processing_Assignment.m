%/////////////////////////// PART(a)//////////////////////
I= imread('pout.tif');% loading the image
subplot(5,3,1);
imshow('pout.tif');% displaying the image
subplot(5,3,2);
imhist(I);% displaying the histogram of the image
title('Histogram of the original image');
ylabel('Number of pixels','FontSize',8,'FontWeight','bold','Color','black')
xlabel('Value of pixel','FontSize',8,'FontWeight','bold','Color','black')

input_pixel=(0:255);
output_pixel=input_pixel;
subplot(5,3,3);
plot(input_pixel,output_pixel);%plotting the output transform for the original image
title('Output transform for the original image');
ylabel('Display value','FontSize',8,'FontWeight','bold','Color','black')
xlabel('Input value','FontSize',8,'FontWeight','bold','Color','black')

%/////////////////////////// PART(b)//////////////////////
y=imadd(I,100); % increase the brightness of the image by adding 100 to every pixel in the image.
subplot(5,3,4);
imshow(y);% displaying the brightened image.

subplot(5,3,5);
imhist(y);% displaying the histogram of the brightened image
title('Histogram of the brightened image');
ylabel('Number of pixels','FontSize',8,'FontWeight','bold','Color','black')
xlabel('Value of pixel','FontSize',8,'FontWeight','bold','Color','black')

%displaying the output transform for the brightened image
in_pixel=(0:255);
out_pixel=in_pixel+100;
out_pixelMax=255;
out_pixel(out_pixel>out_pixelMax)=out_pixelMax;
subplot(5,3,6);
plot(in_pixel, out_pixel);
title('Output transform for the brightened image');
ylabel('Display value','FontSize',8,'FontWeight','bold','Color','black')
xlabel('Input value','FontSize',8,'FontWeight','bold','Color','black')

w=imsubtract(I,100); % decrease the brightness of the image by 100 for every pixel in the image.
subplot(5,3,7);
imshow(w);% displaying the darkened image.
subplot(5,3,8);
imhist(w);% displaying the histogram of the darkened image.
title('Histogram of the Darkened image');
ylabel('Number of pixels','FontSize',8,'FontWeight','bold','Color','black')
xlabel('Value of pixel','FontSize',8,'FontWeight','bold','Color','black')


%displaying the output transform for the darkened image
i_pixel=(0:255);
o_pixel=i_pixel-100;
o_pixelMin=0;
o_pixel(o_pixel<o_pixelMin)=o_pixelMin;
subplot(5,3,9);
plot(i_pixel, o_pixel);
title('Output transform for the darkened image');
ylabel('Display value','FontSize',8,'FontWeight','bold','Color','black')
xlabel('Input value','FontSize',8,'FontWeight','bold','Color','black')

%/////////////////////////// PART(c)//////////////////////
subplot(5,3,10);
j=imadjust(I,[75/255 180/255],[0 255/255]);%adjusting the contrast of the image
imshow([j,I]);%displaying the image after adjusting the contrast

subplot(5,3,11);
imhist(j);%displaying the histogram of the image after adjusting the contrast
title('Histogram of image after adjusting the contrast');
ylabel('Number of pixels','FontSize',8,'FontWeight','bold','Color','black')
xlabel('Value of pixel','FontSize',8,'FontWeight','bold','Color','black')

%displaying the output transform for the image after adjusting the contrast
%the equation of the straight line is y=mx+b since we have 2 points (75,0),(180,255)
%then the slope m = 255/(180-75)=17/7
%to know the constant b take the point(75,0):0=75*(17/7)+b then b=-1275/7
%then y = (17/7*x)-(1275/7)
inp_pixel=0:255;
outp_pixel=(17/7*inp_pixel)-(1275/7);
outp_pixel(find(outp_pixel<0))= 0;  
outp_pixel(find(outp_pixel>255))= 255;
subplot(5,3,12);
plot(inp_pixel, outp_pixel);

title('Output transform for the image after contrast');
ylabel('Display value','FontSize',8,'FontWeight','bold','Color','black')
xlabel('Input value','FontSize',8,'FontWeight','bold','Color','black')

%/////////////////////////// PART(d)//////////////////////
%performing histogram equalization for the image;
output_tranform=(0:255);
subplot(5,3,13)
[new_image,output_tranform]=histeq(I);
imshow([new_image,I]);

subplot(5,3,14);
imhist(new_image);%displaying the histogram of the image after the histogram equalization
title('Histogram of image after equalization');
ylabel('Number of pixels','FontSize',8,'FontWeight','bold','Color','black')
xlabel('Value of pixel','FontSize',8,'FontWeight','bold','Color','black')

%displaying the output transform of the image after the histogram equalization
subplot(5,3,15);
plot(output_tranform);
title('Output transform for the image after the histogram equalization');
ylabel('Display value','FontSize',8,'FontWeight','bold','Color','black')
xlabel('Input value','FontSize',8,'FontWeight','bold','Color','black')



















