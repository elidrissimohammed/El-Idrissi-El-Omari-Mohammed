clear all
close all
clc
%% TP2 %% Jeux de mots%

% 1: Sauvegarder et Tracer le signal entregistre. 

[y,fs]=audioread("audio.ogg");
N=length(y);
ts=1/fs;
t = (0:N-1)*ts;
plot(t,y)
% 2: Ecouter le signal enregiste
sound(y,fs);
% 3: Modifier la frequence d'echantillonage du signal
sound(y,2*fs); %pour compresser le signal
sound(y,fs/2); %pour dilater le signal


% 4: Reperer les indices de debut

riennesertde=y(5055:76000);
plot(riennesertde);
title('Rien ne sert de');
%Après le traçage de la fonction x on peut arriver a voir que le morceau 
%Rien ne sert de  contenue dans la partie de l'index 1025 j'usqu'à 2.05e05

% 5: Segmenter le premier mot

riennesertde=y(5055:760000);
sound(riennesertde,fs);

% 6: Segmenter toute la phrase
riennesertde=y(5055:760000);
courir=y(76000:96000);
sound(courir,fs);
ilfaut=y(960000:150000);
sound(ilfaut,fs);
partirapoint=y(150000:200000);
sound(partirapoint,fs);



% 7: Rien ne sert de partir a point, il faut courir
vector=[riennesertde ;partirapoint ;ilfaut;courir];
sound(vector,fs);


% Synthèse et analyse spectrale d’une gamme de musique

%% 
% 1: Synthèse d'une gamme de musique



fe=8192;
te=1/fe;
N=5000;
t=(0:N-1)*te;
do=10*cos(2*pi*262*t);
%sound(do,fe)
re=10*cos(2*pi*294*t);
%sound(re,fe)
mi=10*cos(2*pi*330*t);
%sound(mi,fe)
fa=10*cos(2*pi*349*t);
%sound(re,fa)
sol=10*cos(2*pi*392*t);
%sound(sol,fe)
la=10*cos(2*pi*440*t);
%sound(la,fe)
si=10*cos(2*pi*494*t);
%sound(si,fe)
do2=10*cos(2*pi*523*t);
%sound(do2,fe)
musique=[do,re,mi,fa,sol,la,si,do2];
sound(musique,fe)
 

% 2: Spectre de la gamme de musique

f=(0:N-1)*(fe/N);
spectre_musique=fft(musique);
signalAnalyzer(abs(fftshift(spectre_musique)))