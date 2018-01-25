%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Initial Variables
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
NumParticles = 1;
timestep = 0.1;
totaltime = 50;
force = 0.0000001;
m = 9.11E-31;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



x = zeros(1,NumParticles);
v = zeros(1,NumParticles);
driftvel = 0;
vAVG = 0;
xAVG = 0;

figure(1);
for i =0:timestep:totaltime
    for kt = 1:NumParticles
        x(kt) = x(kt) + v(kt)*timestep;
        v(kt) = v(kt) + timestep*force/m;
        if rand < 0.05
            v(kt) = 0;
        end
    end
    xAVG = mean(x);
    vAVG = mean(v);
    driftvel = (driftvel*(i) + vAVG*timestep)/(i+1);
    subplot(2,1,1);
    title(driftvel);
    plot(i, xAVG, 'r+');
    hold on;
    subplot(2,1,2);
    plot(i,vAVG, 'b+');
    pause(.1);
    hold on;
end
hold off;
k = 5;
F = @(x) k*(x-x0)^2;
