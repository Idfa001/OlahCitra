clear all;
close all;
pkg load image;

function [H] = Lacunarity(RGB)

GR = im2bw(RGB);
[tinggi, lebar] = size(GR);

RGB = double(RGB);
GR = double(GR);

% Hitung warna rata-rata R, G, dan B
jumlsr_atas=0;
jumlsr_bawah=0;
jumlsg_atas=0;
jumlsg_bawah=0;
jumlsb_atas=0;
jumlsb_bawah=0;
jumls_atas=0;
jumls_bawah=0;
jum_piksel = 0;
for Baris = 1:tinggi
    for Kolom = 1:lebar
        jum_piksel = jum_piksel + 1; 
          
        jumlsr_atas = jumlsr_atas + RGB(Baris, Kolom, 1)^2;
        jumlsg_atas = jumlsg_atas + RGB(Baris, Kolom, 2)^2;
        jumlsb_atas = jumlsb_atas + RGB(Baris, Kolom, 3)^2;
        jumls_atas = jumls_atas + GR(Baris, Kolom)^2;
          
        jumlsr_bawah = jumlsr_bawah + RGB(Baris, Kolom, 1);
        jumlsg_bawah = jumlsg_bawah + RGB(Baris, Kolom, 2);
        jumlsb_bawah = jumlsb_bawah + RGB(Baris, Kolom, 3);
        jumls_bawah = jumls_bawah + GR(Baris, Kolom);
    end    
end

jumlar=0;
jumlag=0;
jumlab=0;
jumla=0;

juml2r=0;
juml2g=0;
juml2b=0;
juml2=0;

juml4r=0;
juml4g=0;
juml4b=0;
juml4=0;

juml6r=0;
juml6g=0;
juml6b=0;
juml6=0;

juml8r=0;
juml8g=0;
juml8b=0;
juml8=0;

juml10r=0;
juml10g=0;
juml10b=0;
juml10=0;

for Baris = 1:tinggi
    for Kolom = 1:lebar
        jumlar = jumlar + abs(RGB(Baris, Kolom, 1)) / ...
                 (jumlsr_bawah/jum_piksel) -1;
        jumlag = jumlag + abs(RGB(Baris, Kolom, 2)) / ...
                 (jumlsg_bawah/jum_piksel) -1;
        jumlab = jumlab + abs(RGB(Baris, Kolom, 3)) / ...
                 (jumlsb_bawah/jum_piksel) -1;
        jumla = jumla + abs(GR(Baris, Kolom)) / ...
                 (jumls_bawah/jum_piksel) -1;
          
        juml2r = juml2r + (RGB(Baris, Kolom, 1) / ...
                 (jumlsr_bawah/jum_piksel) -1)^2;
        juml2g = juml2g + (RGB(Baris, Kolom, 2) / ...
                 (jumlsg_bawah/jum_piksel) -1)^2;
        juml2b = juml2b + (RGB(Baris, Kolom, 3) / ...
                 (jumlsb_bawah/jum_piksel) -1)^2;
        juml2 = juml2 + (GR(Baris, Kolom) / ...
                 (jumls_bawah/jum_piksel) -1)^2;
          
        juml4r = juml4r + (RGB(Baris, Kolom, 1) / ...
                 (jumlsr_bawah/jum_piksel) -1)^4;
        juml4g = juml4g + (RGB(Baris, Kolom, 2) / ...
                 (jumlsg_bawah/jum_piksel) -1)^4;
        juml4b = juml4b + (RGB(Baris, Kolom, 3) / ...
                 (jumlsb_bawah/jum_piksel) -1)^4;
        juml4 = juml4 + (GR(Baris, Kolom) / ...
                 (jumls_bawah/jum_piksel) -1)^4;
          
        juml6r = juml6r + (RGB(Baris, Kolom, 1) / ...
                 (jumlsr_bawah/jum_piksel) -1)^6;
        juml6g = juml6g + (RGB(Baris, Kolom, 2) / ...
                 (jumlsg_bawah/jum_piksel) -1)^6;
        juml6b = juml6b + (RGB(Baris, Kolom, 3) / ...
                 (jumlsb_bawah/jum_piksel) -1)^6;
        juml6 = juml6 + (GR(Baris, Kolom) / ...
                 (jumls_bawah/jum_piksel) -1)^6;
          
        juml8r = juml8r + (RGB(Baris, Kolom, 1) / ...
                 (jumlsr_bawah/jum_piksel) -1)^8;
        juml8g = juml8g + (RGB(Baris, Kolom, 2) / ...
                 (jumlsg_bawah/jum_piksel) -1)^8;
        juml8b = juml8b + (RGB(Baris, Kolom, 3) / ...
                 (jumlsb_bawah/jum_piksel) -1)^8;
        juml8 = juml8 + (GR(Baris, Kolom) / ...
                (jumls_bawah/jum_piksel) -1)^8;

        juml10r = juml10r + (RGB(Baris, Kolom, 1) / ...
                (jumlsr_bawah/jum_piksel) -1)^10;
        juml10g = juml10g + (RGB(Baris, Kolom, 2) / ...
                (jumlsg_bawah/jum_piksel) -1)^10;
        juml10b = juml10b + (RGB(Baris, Kolom, 3) / ...
                (jumlsb_bawah/jum_piksel) -1)^10;
        juml10 = juml10 + (GR(Baris, Kolom) / ...
                (jumls_bawah/jum_piksel) -1)^10;
   end
end

H.lsr = (jumlsr_atas / jum_piksel) / ...
        (jumlsr_bawah / jum_piksel)^2 - 1;
H.lsg = (jumlsg_atas / jum_piksel) / ...
        (jumlsg_bawah / jum_piksel)^2 - 1;
H.lsb = (jumlsb_atas / jum_piksel) / ...
        (jumlsb_bawah / jum_piksel)^2 - 1;
H.ls = (jumls_atas / jum_piksel) / ...
       (jumls_bawah / jum_piksel)^2 - 1;

H.lar = jumlar / jum_piksel;
H.lag = jumlag / jum_piksel;
H.lab = jumlab / jum_piksel;
H.la = jumla / jum_piksel;

H.l2r = sqrt(juml2r / jum_piksel);
H.l2g = sqrt(juml2g / jum_piksel);
H.l2b = sqrt(juml2b / jum_piksel);
H.l2 = sqrt(juml2 / jum_piksel);

H.l4r = (juml4r / jum_piksel)^(1/4);
H.l4g = (juml4g / jum_piksel)^(1/4);
H.l4b = (juml4b / jum_piksel)^(1/4);
H.l4 =  (juml4 / jum_piksel)^(1/4);

H.l6r = (juml6r / jum_piksel)^(1/6);
H.l6g = (juml6g / jum_piksel)^(1/6);
H.l6b = (juml6b / jum_piksel)^(1/6);
H.l6 =  (juml6 / jum_piksel)^(1/6);

H.l8r = (juml8r / jum_piksel)^(1/8);
H.l8g = (juml8g / jum_piksel)^(1/8);
H.l8b = (juml8b / jum_piksel)^(1/8);
H.l8 =  (juml8 / jum_piksel)^(1/8);

H.l10r = (juml10r / jum_piksel)^(1/10);
H.l10g = (juml10g / jum_piksel)^(1/10);
H.l10b = (juml10b / jum_piksel)^(1/10);
H.l10 =  (juml10 / jum_piksel)^(1/10);

