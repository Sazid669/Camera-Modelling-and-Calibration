

function Projection_matrix = get_projection_matrix_from_2D_3D_points_by_Hall_Method(points_2d,points_3d)
sz=size(points_3d);n=sz(1,2);
p3 = points_3d';
Q=zeros(12,11);
j=1;
%calculating Q matrix
for i=1:n
    Q(j,:)=[p3(i,:) zeros(1,4) -points_2d(1,i).*points_3d(1,i) -points_2d(1,i).*points_3d(2,i) -points_2d(1,i).*points_3d(3,i)];
    Q(j+1,:)=[zeros(1,4) p3(i,:) -points_2d(2,i).*points_3d(1,i) -points_2d(2,i).*points_3d(2,i) -points_2d(2,i).*points_3d(3,i)];
    j=j+2;
end
%calculating B matrix
B=zeros(n*2,1);
k=1;
for i=1:n
    B(k)=points_2d(1,i);
    B(k+1)=points_2d(2,i);
    k=k+2;
end
A=Q\B; % A=Inverse(Q).B
A(12)=1;
%Organizing the unknowns in projection matrix
Projection_matrix=zeros(3,4);
t=1;
for i=1:3
    for j=1:4
     Projection_matrix(i,j)=A(t);
     t=t+1;
    end
end
