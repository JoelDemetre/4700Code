%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Initialize
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
nx = 100;
ny = 100;
LC = 1;
RC = 0;
numIterations = 10000;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Vold = zeros(nx, ny);
Vnew = zeros(nx, ny);
Vold(1,:) = 1;
Vold(nx,:) = 1;
Vold(:,1) = 0;
Vold(:,ny) = 0;


oneDiv = zeros(nx, ny);
oneDivOld = zeros(nx, ny);
oneDivOld(1,:) = 1;
oneDivOld(nx,:) = 1;
oneDivOld(:,1) = 0;
oneDivOld(:,ny) = 0;



for kt= 1:numIterations
Vold = Vnew;
Vnew(1,:) = 1;
Vnew(nx,:) = 1;
Vnew(:,1) = 0;
Vnew(:,ny) = 0;
[Ex, Ey] = gradient(Vnew);


for i=2:nx-1
   for j=2:ny-1
       if j == 1
         Vnew(i,j) = (Vold(i-1, j) + Vold(i+1, j)  + Vold(i, j+1))/3;
       elseif j == ny
          Vnew(i,j) = (Vold(i-1, j) + Vold(i+1, j) + Vold(i, j-1))/3;
       else
           Vnew(i,j) = (Vold(i-1, j) + Vold(i+1, j) + Vold(i, j-1) + Vold(i, j+1))/4;
           %oneDiv(i,j) = (oneDivOld(i+1,j) + oneDivOld(i,j))/2 + (oneDivOld(i,j+1) + oneDivOld(i,j))/2;
       end
       
   end
end

end

figure(1);
surf(Vnew);
figure(2);
quiver(Ex, Ey);
figure(3);
Vnew = imboxfilt(Vnew,3);
surf(Vnew);
