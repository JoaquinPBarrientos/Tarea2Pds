%Para partir, obtenemos cada canción en un vector
% y seleccionamos un canal.

Rr = [44100*30,44100*45];
[rock,frock] = audioread('02 - Rock and Roll.flac',Rr);
rock_channel = rock(:,1);

Rp = [44100*30,44100*45];
[pop,fpop] = audioread('02. Dont Start Now.flac',Rp);
pop_channel = pop(:,1);

Re = [44100*30,44100*45];
[electro,felectronica] = audioread('05 - Space Diver.flac',Re);
electro_channel = electro(:,1);

% Graficamos cada espectrograma para cada canción.

subplot(3,1,1)
spectrogram(rock_channel,400,300,[],frock,'yaxis');
title('Rock')

subplot(3,1,2)
spectrogram(pop_channel,400,300,[],fpop,'yaxis');
title('Pop')

subplot(3,1,3)
spectrogram(electro_channel,400,300,[],felectronica,'yaxis');
title('Electrónica')

%Ahora realizamos  PSD, ojo que las canciones son de alta fidelidad, por lo
% que se demora.

c = spectrum.welch;

figure
title('Rock')
rock_psd = psd(c,rock_channel,"fs",frock);
plot(rock_psd);

figure
title('Pop')
pop_psd = psd(c,pop_channel,"fs",fpop);
plot(pop_psd);

figure
title('Electrónica')
electronica_psd = psd(c,electro_channel,"fs",felectronica);
plot(electronica_psd);



