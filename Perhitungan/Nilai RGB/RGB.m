input_gambar = input('Input Gambar: '); 
A= imread (input_gambar); 
I= im2double(A);
nilai_red= I(:,:,1); 
nilai_green= I(:,:,2); 
nilai_blue= I(:,:,3); 
%disp (nilai_red)
%disp(nilai_green)
disp(nilai_blue)