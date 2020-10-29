%Para partir, obtenemos cada canción en un vector
% y seleccionamos un canal.

[rock,frock] = audioread('01 - Good Times Bad Times.flac');
rock_channel = rock(:,1);

[pop,fpop] = audioread('02. Dont Start Now.flac');
pop_channel = pop(:,1);

[electro,felectronica] = audioread('05 - Space Diver.flac');
electro_channel = electro(:,1);

% Graficamos cada espectrograma para cada canción.

subplot(3,1,1)
spectrogram(rock_channel,400,300,[],frock,'yaxis');

subplot(3,1,2)
spectrogram(pop_channel,400,300,[],fpop,'yaxis');

subplot(3,1,3)
spectrogram(electro_channel,400,300,[],felectronica,'yaxis');

%Ahora realizamos  PSD, ojo que las canciones son de alta fidelidad, por lo
% que se demora.

c = spectrum.welch;
figure
rock_psd = psd(c,rock_channel,"fs",frock);

plot(rock_psd);


