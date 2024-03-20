function points_2d = get_2D_points(Projection_matrix,points_3d)

%no of 3d points
num_of_points=size(points_3d,2); 

%Computing projected 3d points
projected_points=zeros(3,num_of_points);

for i=1:num_of_points
     projected_points(:,i)= Projection_matrix * points_3d(:,i);
end

%Computing 2D points
points_2d=zeros(2,num_of_points);

for i=1:2
    for j=1:num_of_points
        points_2d(i,j)=projected_points(i,j)./projected_points(3,j);
    end
end