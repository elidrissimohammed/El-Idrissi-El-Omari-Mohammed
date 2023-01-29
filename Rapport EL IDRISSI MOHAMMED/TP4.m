clear all
close all
clc
%%TP4%Filtrage Analogique%
% Filtrage et diagramme de Bode

%1: Definir le signal x(t)

f1=500;
f2=400;
f3=5;
te=0.0001;
fe=1/te;
t=0:te:5;
n=length(t);
x=sin(2*pi*f1*t)+sin(2*pi*f2*t)+sin(2*pi*f3*t);
spectre_x=fftshift(abs(fft(x)));
% 2: Tracer x(t) et sa transformee de Fourier
f=linspace(-fe/2,fe/2,n);
subplot(2,1,1)
title("X")
plot(t,x)
subplot(2,1,2)
plot(f,spectre_x)
title("Spectre du signal X")
%Si on change Te on remarque que le signal n'est pas precis.

% 1: Tracer le module de H(f)
K=1;
wc=50;
H=(K*j*w/wc)./(1+j*w/wc);
semilogx(f,abs(H));

% 2: Tracer 20*log(|H(f)|) pour differentes pulsations de coupure wc

g=20*log(abs(H));
semilogx(f,g);

% De-bruitage d'un signal sonore
% 1 : Methode pour supprimer le bruit: Filtrage
%% 
% 2 : 
[music, fs] = audioread('test.wav');
music = music';
N=length(music);
te = 1/fs;
t = (0:N-1)*te;

f = (0:N-1)*(fs/N);
fshift = (-N/2:N/2-1)*(fs/N);

y_trans = fft(music);
 subplot(3,1,1)
 
 subplot(3,1,2)
 plot(fshift,fftshift(abs(y_trans)))


