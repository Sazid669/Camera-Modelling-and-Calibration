

function avg_error = get_average_projection_error(old_2d_points,new_2d_points)

sz=size(old_2d_points); n=sz(2);
sum=0;

for i=1:n
    sum=sum+ sqrt((old_2d_points(1,i)-new_2d_points(1,i))^2+(old_2d_points(2,i)-new_2d_points(2,i))^2);
end
avg_error=sum/n;






