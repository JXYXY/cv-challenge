% display the image
I = imread('uhren-turm.jpg');
x_max = size(I,2);
y_max = size(I,1);
imshow(I)
hold on
% select the vanishing point manually
[x_vp,y_vp] = ginput(1)
plot(x_vp,y_vp,'ro')
% select the foreground 1 2 8 7
[x_sp,y_sp] = ginput(4)
x_sp = [x_sp ; x_sp(1)];
y_sp = [y_sp ; y_sp(1)];
% gradient for the foreground
for i =1:4
    gradient(i) = (y_sp(i)-y_vp)/(x_sp(i)-x_vp)
end
plot(x_sp,y_sp,'b')
estimatedVertex = zeros(2,12);
estimatedVertex(:,1) = [x_sp(1);y_sp(1)];
estimatedVertex(:,2) = [x_sp(2);y_sp(2)];
estimatedVertex(:,8) = [x_sp(3);y_sp(3)];
estimatedVertex(:,7) = [x_sp(4);y_sp(4)];

estimatedVertex(:,3) = [(y_max-y_vp)/gradient(1) + x_vp; y_max];
estimatedVertex(:,5) = [0; (0-x_vp)*gradient(1) + y_vp];
estimatedVertex(:,4) = [(y_max-y_vp)/gradient(2) + x_vp; y_max];
estimatedVertex(:,6) = [x_max; (x_max-x_vp)*gradient(2) + y_vp];
estimatedVertex(:,10) = [(0-y_vp)/gradient(3) + x_vp; 0];
estimatedVertex(:,12) = [x_max; (x_max-x_vp)*gradient(3) + y_vp];
estimatedVertex(:,9) = [(0-y_vp)/gradient(4) + x_vp; 0];
estimatedVertex(:,11) = [0; (0-x_vp)*gradient(4) + y_vp];


for i = 1:12
    plot([estimatedVertex(1,i),x_vp],[estimatedVertex(2,i),y_vp],'-')
    text(estimatedVertex(1,i),estimatedVertex(2,i),num2str(i))
end


%% view point
% [x_viewPoint,y_viewPoint] = ginput(1)
% plot(x_viewPoint,y_viewPoint,'bo')
% z_viewPoint = 0;
% 
% for i=1:6
%     grad = -y_viewPoint/(estimatedVertex(2,i)-y_viewPoint);
%     estimatedVertexWorld(1,i) = grad * (estimatedVertex(2,i) - x_viewPoint);
%     estimatedVertexWorld(3,i) = grad *
%     grad*(-1.0f-eye.z)+eye.z











