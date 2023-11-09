function [t,err,count] = Newton_Raphson(l1,l2,l3,t0)
%Function to find the angle of a triangle formed by the bars of the backhoe
%Newton-Raphson is used to solve the closure equation in order to find the
%angle.
%t = a 2x1 matrix that contains theta2 and theta3 of the
%triangle required.
%err = norm of vector function evaluated at estimated zero.
%Output count = number of iterations required
%l1,l2,l3 are length of the hydraulic bar of each triangle.
%t0 = A 2X1 matrix of initial guess of the angle theta2 and theta3 of a triangle
% Version 1: created 08/04/22. Author CW. Lin
%Error check
if ~isscalar(l1) || ~isreal(l1)
 error('Input argument l1 must be scalar and real')
end
if ~isscalar(l2) || ~isreal(l2)
 error('Input argument l2 must be scalar and real')
end
if ~isscalar(l3) || ~isreal(l3)
 error('Input argument l3 must be scalar and real')
end
if ~isvector(t0)|| ~isreal(t0)
 error('input argument t0 must be vector and real' )
end
Iteration_Limit = 20; % Iteration_Limit = maximum number of steps permitted
Tolerance = 10^-9; % Tolerance = maximum acceptable value for modulus of
function f evaluated at estimated root.
t= t0;
for count = 1:Iteration_Limit+1
 if count == Iteration_Limit+1
%Terminate with error message if iteration limit is reached.
 error('Iteration limit reached. Iteration did not converge.')

 end
%Closure equation formed by a triangle
 f = [l2*cos(t(1))-l1-l3*cos(t(2));l2*sin(t(1))-l3*sin(t(2))];
% Terminate the iteration function if its current estimate is smaller than the
% tolerance value
 if norm(f) < Tolerance
 break
 end
 % Derivative of the function f
 df = [-l2*sin(t(1)) l3*sin(t(2));l2*cos(t(1)) -l3*cos(t(2))];
 %inverse of the function f
 invdf = (1/(df(1)*df(4)-df(3)*df(2)))*([-l3*cos(t(2)) -l3*sin(t(2));-
l2*cos(t(1)) -l2*sin(t(1))]);

 t = t - invdf*f;%Newton-Raphson iteration
end
err = norm(f);
end 