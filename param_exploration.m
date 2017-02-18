 %%  Parameters exploration
 
  addpath('C:\Users\Id0287\Downloads\spgl1-1.9\spgl1-1.9')

%% Q27 

k = 20;
i = 1;
error_matrix = zeros(4,10);

for p=0.1:0.1:1
    
    psnr_MP = [];
    psnr_OMP = [];
    psnr_IHT = [];
    psnr_BP = [];
    display(p);
    for image=1:50
        
        display(image);
        R = 5; % set redundancy
        D = createDictionary(R); 
        
        [x,s] = createImage(D,k,0);
        [y,yDisplay,keepIndices,M] = dropPixels(x,p);
        A = M*D;
        
        nit = k;
        [xMP,SMP,errMP] = applyMP(A,y,2*nit);
        [xOMP,SOMP,errOMP] = applyOMP(A,y,nit);
        [xIHT,SIHT,errIHT] = applyIHT(A,y,100*nit,k,1/(norm(A)^2));
        xBP = spg_bp(A,y);
        
        psnr_MP = [psnr_MP psnr(D*xMP,D*s)];
        psnr_OMP = [psnr_OMP psnr(D*xOMP,D*s)];
        psnr_IHT = [psnr_IHT psnr(D*xIHT,D*s)];
        psnr_BP = [psnr_BP psnr(D*xBP,D*s)];
        
    end
    
    error_matrix(1,i) = mean(psnr_MP);
    error_matrix(2,i) = mean(psnr_OMP);
    error_matrix(3,i) = mean(psnr_IHT);
    error_matrix(4,i) = mean(psnr_BP);
    i = i+1;
end

