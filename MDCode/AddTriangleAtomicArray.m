function AddTriangleAtomicArray(LAtoms, WAtoms, X0, Y0, VX0, VY0, InitDist, Temp, Type)
global C
global x y AtomSpacing
global nAtoms
global AtomType Vx Vy Mass0 Mass1

if Type == 0
    Mass = Mass0;
else
    Mass = Mass1;
end

L = (LAtoms - 1) * AtomSpacing;
W = (WAtoms - 1) * AtomSpacing;

numAtoms = (LAtoms^2)/2;

    counterkp = 1;
    counterkp = counterkp + 1;
for kp = 0:L/LAtoms:L
    counterkt = 1;
    for kt = 0:L/LAtoms:L   
        if kt>kp 
            xp(1, counterkp) = kp;
            yp(1, counterkt) = kt;
        end 
    end
    counterkt = counterkt + 1;
end

x(nAtoms + 1:nAtoms+LAtoms) = xp-L/2;
y(nAtoms + 1:nAtoms+LAtoms) = yp(1)-W/2;

for i = 1:WAtoms-1
    x(nAtoms + i * LAtoms + 1:nAtoms + (i + 1) * LAtoms) = xp - L / 2;
    y(nAtoms + i * LAtoms + 1:nAtoms + (i + 1) * LAtoms) = yp(i + 1) - W / 2;
end

x(nAtoms + 1:nAtoms + numAtoms) = x(nAtoms + 1:nAtoms + numAtoms) + ...
    (rand(1, numAtoms) - 0.5) * AtomSpacing * InitDist + X0;
y(nAtoms + 1:nAtoms + numAtoms) = y(nAtoms + 1:nAtoms + numAtoms) + ...
    (rand(1, numAtoms) - 0.5) * AtomSpacing * InitDist + Y0;

AtomType(nAtoms + 1:nAtoms + numAtoms) = Type;

if Temp == 0
    Vx(nAtoms + 1:nAtoms + numAtoms) = 0;
    Vy(nAtoms + 1:nAtoms + numAtoms) = 0;
else
    std0 = sqrt(C.kb * Temp / Mass);

    Vx(nAtoms + 1:nAtoms + numAtoms) = std0 * randn(1, numAtoms);
    Vy(nAtoms + 1:nAtoms + numAtoms) = std0 * randn(1, numAtoms);
end

Vx(nAtoms + 1:nAtoms + numAtoms) = Vx(nAtoms + 1:nAtoms + numAtoms) - ...
    mean(Vx(nAtoms + 1:nAtoms + numAtoms)) + VX0;
Vy(nAtoms + 1:nAtoms + numAtoms) = Vy(nAtoms + 1:nAtoms + numAtoms) - ...
    mean(Vy(nAtoms + 1:nAtoms + numAtoms)) + VY0;

nAtoms = nAtoms + numAtoms;

end

