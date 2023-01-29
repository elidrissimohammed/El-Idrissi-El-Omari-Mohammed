        %%TP1%% Analyse spectrale d'un signal/ Transformee de Fourier discrete %

clear all
close all
clc

fe = 10000;
te = 1/fe;
N = 5000; 

t = (0:N-1)*te; 

% Représentation temporelle et fréquentielle

x = 1.2*cos(2*pi*440*t+1.2)+3*cos(2*pi*550*t)+0.6*cos(2*pi*2500*t);
figure;

% 1: Tracer le signal x(t)


subplot(2,3,1)
plot(t,x,'.');
title('x(t)')


% 2: La TFD de x(t)

% On crée le vecteur f correspondant à l'échantillonnage du signal, Ensuite
% on applique la transformee de fourier en utilisant la commande fft pour obtenir le spectre d'amplitude( non centre sur 0) et on
% utilise abs pour obtenir le module.


f =(0:N-1)*(fe/N); 
y = fft(x); 
subplot(2,3,2)
plot(f,abs(y));
title(" spectre d'amplitude non centre")


% 3: La fonction fft pour centrer le spectre d'amplitude.

fshift = (-N/2:N/2-1)*(fe/N);
subplot(2,3,3)
plot(fshift,fftshift(2*abs(y)/N))
title("spectre d'amplitude centre")


% 4: Creer le signal noise

%Introduction de bruit 
noise = 5*randn(size(x));
subplot(2,3,4)
plot(noise)
title("x(noise)")


% 5: La commande sound

xnoise = x+noise;
sound(xnoise)


% 6: Le spectre de puissance du signal bruite

ybruit = fft(xnoise);
subplot(2,3,5)
plot(fshift,fftshift((abs(ybruit)*2)/N));
title(" x noise ")


% 7: Augmentation de l'intensite du signal buit 
figure;
noise2 = 20*randn(size(x));
xnoise2=x+noise2;
ybruit2 = fft(xnoise2);
plot(fshift,fftshift((abs(ybruit2))*2/N));
title("x noise 2")

% le spectre de bruit est mélangé avec le spectre  contenant des informations pertinentes, ce qui rend difficile l'extraction et le filtrage du signal

% Analyse fréquentielle du chant du rorqual bleu

% 1: Chargement du fichier contenant le chant du rorqual bleu
[whale,fe]=audioread("bluewhale.au");

chant = whale(2.45e4:3.10e4);
% 2:La commande sound pour ecouter le chant

sound(chant,fe)

% 3: La densite spectrale du puissance du signal
N = length(chant);
te = 1/fe;
t = (0:N-1)*(10*te);
figure;
subplot(2,1,1)
plot(t,chant)
title('Le signal du chant ')
y = abs(fft(chant)).^2/N; 
f = (0:floor(N/2))*(fe/N)/10;
subplot(2,1,2)
plot(f,y(1:floor(N/2)+1));
title('Le signal densite spectrale de puissance du signal')
