% Test di backsub
U=[1 1 3 0; 0 1 2 -1; 0 0 4 1; 0 0 0 3];
b=[2;0;6;6]

x=backsub(U,b)
xm=U\b