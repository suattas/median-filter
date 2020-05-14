clc,clear all,close all
resim=imread('Eye_iris.jpg');
m=5; n=5;
%subplot(1,3,1),imshow(resim)
gri=resim(:,:,1)*.2989+resim(:,:,2)*.5870+resim(:,:,3)*.1140;
%subplot(1,3,2),imshow(gri)
r1=imnoise(gri,'salt & pepper',.02); %Görüntüye gürültü ekledim
figure,imshow(r1)
title('Resmin gürültülü hali')
[m n]=size(r1);
b=5;
for i=1:m-b+1
    for j=1:n-b+1
        x=r1(i:i+b-1,j:j+b-1);
        dizi=x(:)';
        medianfilter(i,j)=median(dizi);
    end
end
figure,imshow(uint8(medianfilter))
title('Resmin 5*5 medyan filtrelenmiş hali hali')
