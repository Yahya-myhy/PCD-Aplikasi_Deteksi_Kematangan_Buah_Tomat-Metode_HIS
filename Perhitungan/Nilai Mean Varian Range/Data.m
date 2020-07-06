input_gambar = input('Input Gambar: '); 
A= imread (input_gambar); 
RGB= im2double(A);
Red= RGB(:,:,1); 
Green= RGB(:,:,2); 
Blue= RGB(:,:,3); 
%Hue
atas=1/2*((Red-Green)+(Red-Blue));
bawah=((Red-Green).^2+((Red-Blue).*(Green-Blue))).^0.5;
teta = acosd(atas./(bawah));
if Blue >= Green
    H = 360 - teta;
else
    H = teta;
end

H = H/360;
[r c] = size(H);
for i=1 : r
    for j=1 : c
        z = H(i,j);
        z(isnan(z)) = 0; %isnan adalah is not none artinya jika bukan angka dia akan memberi 0
        H(i,j) = z;
    end
end
%S
S=1-(3./(sum(RGB,3))).*min(RGB,[],3);
[r c] = size(S);
for i=1 : r
    for j=1 : c
        z = S(i,j);
        z(isnan(z)) = 0;
        S(i,j) = z;
    end
end
%I
I=(Red+Green+Blue)/3;

MeanR = mean2(Red);
MeanG = mean2(Green);
MeanB = mean2(Blue);
MeanH = mean2(H);
MeanS = mean2(S);
MeanI = mean2(I);
VarRed = var(Red(:)); VarGreen = var(Green(:)); VarBlue = var(Blue(:));
VarH = var(H(:)); VarS = var(S(:)); VarI = var(I(:));
RangeR = ((max(max(Red)))-(min(min(Red))));
RangeG = ((max(max(Green)))-(min(min(Green))));
RangeB = ((max(max(Blue)))-(min(min(Blue))));
RangeH = ((max(max(H)))-(min(min(H))));
RangeS = ((max(max(S)))-(min(min(S))));
RangeI = ((max(max(I)))-(min(min(I))));
disp (MeanR)
disp (MeanG)
disp (MeanB)
disp (MeanH)
disp (MeanS)
disp (MeanI)
