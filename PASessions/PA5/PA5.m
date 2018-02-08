bc = [0,0,0,0];
nx = 50;
ny = 50;
deltax = 1;
deltay = 1;
B = zeros(1, nx*ny);


G = sparse(nx*nx, ny*ny);

for i = 1:nx
   G(nx,:) = 0;
   G(nx,nx) = 1; 
end




for i = 1:nx
    for j = 1:ny
        n = j + (i-1)*ny;
        
        if i == 1 || i == nx
           G(n,:) = 0;
           G(n,n) = 1;
        elseif j == ny || j == 1
           G(n,:) = 0;
           G(n,n) = 1;
        else
            G(n,n) = -4;
            G(n,j + (i-2)*ny) = 1;
            G(n,j-1 + (i-1)*ny) = 1;
            G(n,j+1 + (i-1)*ny) = 1;
            G(n,j + (i)*ny) = 1;
        end
        
        
        
    end
end


[E,D] = eigs(G,9,'SM');

V = zeros(50,50,9);


for i = 1:9
   V(:,:,i)= reshape(E(:,i), nx, ny);
end
surf(V(:,:,9));
