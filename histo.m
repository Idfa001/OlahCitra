Img = imread('E:\Kasar.png');
Ukuran = size(Img);
jum_baris = Ukuran(1);
jum_kolom = Ukuran(2);
Histog = zeros(256, 1);
for baris=1 : jum_baris
    for kolom=1 : jum_kolom
        Histog(Img(baris, kolom)+1) = ...
            Histog(Img(baris, kolom)+1) + 1;
    end
end

% Tampilkan dalam bentuk diagram batang
Horis = (0:255)';
bar(Horis, Histog);