%% Ex16, noiseless recovery
[xiht,Siht,erriht] = applyIHT(M*D,y,1000,10,1);
[xOMP,Somp,erromp] = applyOMP(M*D,y,10);
[xMP,Smp,errmp] = applyMP(M*D,y,100);

figure;
subplot(2,2,1); imageDisplay(D*s); title('original');
subplot(2,2,2); imageDisplay(D*xiht);title('IHT');
subplot(2,2,3); imageDisplay(D*xOMP);title('OMP');
subplot(2,2,4); imageDisplay(D*xMP);title('MP');

%% Ex17; noisy recovery
[xiht,Siht,erriht] = applyIHT(M*D,yn,1000,10,1);
[xOMP,Somp,erromp] = applyOMP(M*D,yn,10);
[xMP,Smp,errmp] = applyMP(M*D,yn,100);
figure;
subplot(2,2,1); imageDisplay(D*s); title('original');
subplot(2,2,2); imageDisplay(D*xiht);title('IHT');
subplot(2,2,3); imageDisplay(D*xOMP);title('OMP');
subplot(2,2,4); imageDisplay(D*xMP);title('MP');

%% Ex18

psnr(D*xiht,D*s) %% IHT diverges...
psnr(D*xOMP,D*s) %% 71.9217
psnr(D*xMP,D*s) %% 64.5649

%% Ex19
%% OMP is by far the best for reconstruction. It is also quite fast.
%% IHT diverges and takes time.

%% Ex20
Ss = [];
for i=1:length(s)
    if s(i)~=0
        Ss = [Ss i];
    end
end
sum(abs(xOMP - s))
Somp
sum(abs(xMP - s))
Smp
