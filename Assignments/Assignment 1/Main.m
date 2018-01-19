%Initialize Parameters
xlimits = [0, 1000];
ylimits = [0, 1000];
%Temperature in K
T = 0;
Timestep = 0.1;
endtime = 1000;
NumParticles = 1000;
x = zeros(3,NumParticles);
y = zeros(2,NumParticles);
temp = zeros(2, NumParticles);

%Start the random distribution in x position
x(1,:) =  rand(1,NumParticles);
y(1,:) =  rand(1,NumParticles);
x(1,:) = x(1,:) + xlimits(1) + x(1,:).*(xlimits(2) - xlimits(1));
y(1,:) = y(1,:) + ylimits(1) + y(1,:).*(ylimits(2) - ylimits(1));

%Assign the random velocity and random angle
temp(1,:) = normrnd(150, 25, 1, NumParticles);
x(3,:) = rand(1, NumParticles)*2*pi;
x(2,:) = temp(1,:).*cos(x(3,:));
y(2,:) = temp(1,:).*sin(x(3,:));


%Update the Position
counter = 1;
plot(x(1,1:20), y(1,1:20), '+');
for i = 0:Timestep:endtime
    pause(.1);
    for kt = 1:NumParticles
       if x(1,kt) +  x(2,kt)*Timestep < xlimits(1)
           x(1,kt) = xlimits(2);
       elseif x(1,kt) +  x(2,kt)*Timestep > xlimits(2)
           x(1,kt) = xlimits(1);
       end
       if y(1,kt) +  y(2,kt)*Timestep < ylimits(1) || y(1,kt) +  y(2,kt)*Timestep > ylimits(2)
           y(2,kt) = -y(2,kt);
       end
    end
    x(1,:) = x(1,:) +  x(2,:).*Timestep;
    y(1,:) = y(1,:) + y(2,:).*Timestep;
    plot(x(1,1:20), y(1,1:20), '+');
    xlim([0, 1000]);
    ylim([0, 1000]);
end


