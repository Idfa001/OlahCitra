function [E] = laws(F, cadar1, cadar2, w)
 
F = double(F)
 
L3 = [1 2 1];
E3 = [-1 0 -1];
S3 = [-1 2 -1];


L5 = [1 4 6 4 1];
E5 = [-1 -2 0 2 1];
S5 = [-1 0 2 0 -1];
R5 = [1 -4 6 -4 1];
W5 = [-1 2 0 -2 1];

% Cek cadar 1
if strcmp(cadar1, 'L3') == 1
    Cd1 = L3;
    ukuran1 = 3;
elseif strcmp(cadar1, 'E3') == 1
    Cd1 = E3;
    ukuran1 = 3;
elseif strcmp(cadar1, 'S3') == 1
    Cd1 = S3;
    ukuran1 = 3;
elseif strcmp(cadar1, 'L5') == 1
    Cd1 = L5;
    ukuran1 = 5;
elseif strcmp(cadar1, 'E5') == 1
    Cd1 = E5;
    ukuran1 = 5;
elseif strcmp(cadar1, 'S5') == 1
    Cd1 = S5;
    ukuran1 = 5;
elseif strcmp(cadar1, 'R5') == 1
    Cd1 = R5;
    ukuran1 = 5;
elseif strcmp(cadar1, 'W5') == 1
    Cd1 = W5;
    ukuran1 = 5;
else
    ukuran1 = 0;
end

% Cek cadar 2
if strcmp(cadar2, 'L3') == 1
    Cd2 = L3;
    ukuran2 = 3;
elseif strcmp(cadar2, 'E3') == 1
    Cd2 = E3;
    ukuran2 = 3;
elseif strcmp(cadar2, 'S3') == 1
    Cd2 = S3;
    ukuran2 = 3;
elseif strcmp(cadar2, 'L5') == 1
    Cd2 = L5;
    ukuran2 = 5;
elseif strcmp(cadar2, 'E5') == 1
    Cd2 = E5;
    ukuran2 = 5;
elseif strcmp(cadar2, 'S5') == 1
    Cd2 = S5;
    ukuran2 = 5;
elseif strcmp(cadar2, 'R5') == 1
    Cd2 = R5;
    ukuran2 = 5;
elseif strcmp(cadar2, 'W5') == 1
    Cd2 = W5;
    ukuran2 = 5;
else
    ukuran2 = 0;
end

% Cek kebenaran cadar
ukuran = ukuran1 * ukuran2;
if ~(ukuran == 9 || ukuran == 25)
    error('Cadar tidak valid');
end

Matriks = Cd1' * Cd2;

% Konvolusi citra dengan cadar
E = konvolusi2(F, Matriks);

% Lakukan pererataan dengan jendela berukuran w x w
H=ones(w,w)/(w^2);
E=konvolusi2(E, H);

% Lakukan normalisasi ke 0 s/d 255
terkecil = min(min(E));
terbesar = max(max(E));
E = (E-terkecil) / (terbesar - terkecil) * 255;

% Kosongkan bagian tepi
[tinggi, lebar] = size(E);
E(1:15,:) = 0;
E(tinggi-15: tinggi,:) = 0;
E(:, 1:15) = 0;
E(:, lebar-15 : lebar) = 0;
E = uint8(E);