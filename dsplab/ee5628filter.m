clear;
close all;
h = [1,-0.5 , 1, 3];

stem(h);
figure;
freqz(h);
%hd=dfilt.dfsymfir(h);
hd = dfilt.dffir(h);
realizemdl(hd);