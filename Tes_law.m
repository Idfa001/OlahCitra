Lena = imread('E:\Miu.jpg'); 
G = laws(Lena,'R5','S5',15); 
figure(1);
subplot(1,2,1);imshow(G);title('G')
subplot(1,2,2);imshow(img);title('asli')