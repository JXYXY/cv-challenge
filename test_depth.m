% display the image
I = imread('uhren-turm.jpg');
x_max = size(I,2);
y_max = size(I,1);
imshow(I)
hold on
% select the vanishing point manually
% [x_vp,y_vp] = ginput(1)
% plot(x_vp,y_vp,'ro')
x_vp = 266;
y_vp = 227;
% select the foreground 1 2 8 7
% [x_sp,y_sp] = ginput(4)
% x_sp = [x_sp ; x_sp(1)];
% y_sp = [y_sp ; y_sp(1)];
x_sp = [196 348 348 196 196];
y_sp = [288 288 94 94 288];
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
f = 200;
l_bottom = abs(y_max - y_vp);
l_top = abs(y_vp - 0);
l_right = abs(x_max - x_vp);
l_left = abs(x_vp - 0) ;

d_bottom28 = l_bottom * f / abs(estimatedVertex(2,2) - y_vp) - f;
d_top28 = l_top * f / abs(estimatedVertex(2,8) - y_vp) - f;
d_right78 = l_right * f / abs(estimatedVertex(1,8) - x_vp) - f;
d_left78 = l_left * f / abs(estimatedVertex(1,7) - x_vp) - f;


l_bottom = abs(y_max - y_vp);
l_top = abs(y_vp - 0);
l_right = abs(x_max - x_vp);
l_left = abs(x_vp - 0) ;

d_bottom17 = l_bottom * f / abs(estimatedVertex(2,1) - y_vp) - f;
d_top17 = l_top * f / abs(estimatedVertex(2,7) - y_vp) - f;
d_right12 = l_right * f / abs(estimatedVertex(1,2) - x_vp) - f;
d_left12 = l_left * f / abs(estimatedVertex(1,1) - x_vp) - f;
% 1D
% D = [d_bottom28 d_top28 d_right78 d_left78 d_bottom17 d_top17 d_right12 d_left12];
% d = max(D);
% 4D
D28 = max(d_bottom28,d_top28);
D78 = max(d_left78,d_right78);
D17 = max(d_bottom17,d_top17);
D12 = max(d_left12,d_right12);













