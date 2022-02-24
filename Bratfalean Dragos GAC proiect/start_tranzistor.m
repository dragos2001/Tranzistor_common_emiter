clc;
close all;

Rb1=110000;
Rb2=10000;
Rc=10000;
Re=1000;
A=0.5;  
f=80;
beta=100;
Vcc=20;
psf_emitor_comun(Rb1,Rb2,Rc,Re,beta,Vcc,A,f);