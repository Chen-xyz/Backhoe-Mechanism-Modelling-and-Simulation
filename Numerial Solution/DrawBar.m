function drawBar(op,len,theta)

%Function to draw a bar with a circular cross sectional area
%op = coordinate of the bar calculated from coordinate
%len = length of the bar
%theta = angle of the bar calculated by Newton-Raphson
%Version 1:created 09/04/22. Author CW.Lin

N = 200;%Number of points on circular cross sections
r_bar = 0.1;%radius of the bar

phi = [0:2*pi/N:(2*pi)-(2*pi/N)]'; %angle data

% create data for cylindrical patch representing rod
vertices1_bar = [r_bar*cos(phi) zeros(N,1) r_bar*sin(phi)] ;
vertices2_bar = [r_bar*cos(phi) len*ones(N,1) r_bar*sin(phi)] ;
vertices_bar = [vertices1_bar; vertices2_bar] ;

%Face matrix of the bar
faces_all = [[1:N];[1:N]' [[2:N] 1]' [(N+[2:N]) N+1]' ((N+[1:N])')*ones(1,N3);N+[1:N]];
% set aside memory to store rotated vertex co-ordinates
vertices_bar_rotated = zeros(2*N,3);

% create matrix of rotation in y-z plane through theta
Rtheta = [1 0 0; 0 cos(theta) sin(theta);0 -sin(theta) cos(theta)];

%Rotation of the bar
for count = 1:2*N
 vertices_bar_rotated(count,:) = (Rtheta*(vertices_bar(count,:)'))';
end

%Translate the bar after rotation
for count = 1:2*N
 jkl(count,:) = [(op(1)+(vertices_bar_rotated(count,1)'))'
(op(2)+(vertices_bar_rotated(count,2)'))'
(op(3)+(vertices_bar_rotated(count,3)'))' ];
end

axis([-len len -len len -1.1*len 0.2*len])
axis off
light %use default lighting
handlepatch_bar = patch('Vertices',jkl,'Faces',faces_all,'FaceColor',[1 0
0],'LineStyle', 'none', 'FaceLighting', 'phong');
set(handlepatch_bar,'DiffuseStrength',1.0,'SpecularStrength',1.0)

view(90,0)%To view from Y-Z plane
zoom(0.07)%To out of the scene in order to see the full plot