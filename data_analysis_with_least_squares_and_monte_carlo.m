
% You have to press "Enter" to see the graphics.
% You will see the results with graphics
% This project includes both the least squares method and the Monte Carlo method



% LEAST SQUARE METHOD GRAPHIC DRAWING

%Data; The first column is the x value and the second column is the y value.
xy = [
 -6,-21
 -5,-20
 -4,-16
 -3,-10
 -2, -7
 -1, -2
 0, 2
 1, 6
 2, 11
 3, 13
 4, 18
 5, 24
 6, 25];

x = xy(:,1);
y = xy(:,2);

%%First Step 
%In line with the data, the x-y graph was drawn with the points as circles:
disp("Marking Data in Chart")
disp("")
plot(x,y,"o-")
pause()

%%Second Step:
A11 = A12 = A22 = B11 = B12 = 0;
N = rows(x);
for i = 1:N  
  A11 = A11 + 2*x(i)^2;
  A12 = A12 + 2*x(i);
  A22 = A22 + 2;
  B11 = B11 + 2*x(i)*y(i);
  B12 = B12 + 2*y(i);
endfor 
disp("Least Squares Method Graphic")
m = (B11 - (A12 * B12 / A22))  / (A11 - (A12^2 / A22))
n = (B12 - A12 * m) / A22 
disp(" ")
xx = linspace(-6,6,100);
tt = m.*xx + n;
plot(xx,tt,x,y,"ro")
pause()

%%Third Step:
%Points and lines are printed as desired by writing the required range and equation for the parabola.
x_range = -6:6;
parabola = x_range.^2+x_range.*4-24;


%%Fourth Step:
%Intersection points found by zooming in on the chart
disp("Intersection points found by zooming in on the chart")
zoom_x1=-5.0272;
zoom_x2=5.1134;

%The operations are completed by typing the roots found or found by zooming into the equations.
z_yroot1 = m.*zoom_x1 + n;   % The value of y on the line of the first root
z_yroot2 = m.*zoom_x2 + n;   % The value of y on the line of the second root
z_y_root1 = zoom_x1^2+zoom_x1*4-24;  % The y-value of the first root on the parabola
z_y_root2 = zoom_x2^2+zoom_x2*4-24;  % The y-value of the second root on the parabola
z_diff1 = abs(z_yroot1-z_y_root1);  % the differences of the absolute values for the first root
z_diff2 = abs(z_yroot2-z_y_root2);  % the differences of the absolute values for the second root
fprintf("First Point on Line: %g, %g \n",zoom_x1,z_yroot1);
fprintf("First Point on Parabola: %g, %g \n",zoom_x1,z_y_root1);
fprintf("Second Point on the Line: %g, %g \n",zoom_x2,z_yroot2);
fprintf("Second Point on Parabola: %g, %g \n",zoom_x2,z_y_root2);
fprintf("The Difference Between the First Points: %g\n",z_diff1);
fprintf("The Difference Between the Second Points: %g\n",z_diff2);
disp(" ")

%% BONUS FOR THE LEAST SQUARE METHOD
%In short, the intersection points are determined with the help of a program that finds the roots of the equation.
intersection = x_range.^2+x_range.*(4-m)-(24+n);
A= 1;
B= 4-m;
C= -24-n;
% A simple program is written with the delta method and the roots of the equation are found.
disp("Intersection points found by delta method")
delta=B^2-4*A*C;
if delta > 0
    x1=(-B-sqrt(delta))/(2*A);
    x2=(-B+sqrt(delta))/(2*A);
endif
% The points we preferred here were the root points that were found precisely.
% Calculating the y-values of the roots:
yroot1 = m.*x1 + n; % The value of y on the line of the first root
yroot2 = m.*x2 + n; % The value of y on the line of the second root
y_root1 = x1^2+x1*4-24; % The y-value of the first root on the parabola
y_root2 = x2^2+x2*4-24; % The y-value of the second root on the parabola
diff1 = abs(yroot1-y_root1);% the differences of the absolute values for the first root
diff2 = abs(yroot2-y_root2);% the differences of the absolute values for the second root
fprintf("First Point on Line: %g, %g \n",x1,yroot1);
fprintf("First Point on Parabola: %g, %g \n",x1,y_root1);
fprintf("Second Point on the Line: %g, %g \n",x2,yroot2);
fprintf("Second Point on Parabola: %g, %g \n",x2,y_root2);
fprintf("The Difference Between the First Points: %g\n",diff1);
fprintf("The Difference Between the Second Points: %g\n",diff2);
disp(" ")
plot(xx,tt,"r-",x,y,"mx",x_range,parabola,"b-o")
pause()




% INTEGRAL CALCULATION WITH MONTE CARLO METHOD
disp("INTEGRAL CALCULATION WITH MONTE CARLO METHOD")
k1 = [(-5.0299), (-5.0299), (5.1233), (5.1233),(-5.0299)];
k2 = [(-29), (25), (25), (-29), (-29) ];

%% BONUS SECTION FOR RECTANGULAR
%cutting = x^2+x*(4-m)-(24+n);
%integral içi: mx+n - (x^2+4*x-24) = -x^2+(m-4)*x+24+n
%integral : -x^3/3+x^2*((m-4)/2)+((24+n)*x)
% x1=5.12326, x2=-5.02985 was found from the roots of the cutting
int_above = (-x2^3)/3+x2^2*((m-4)/2)+((24+n)*x2);
int_below = (-x1^3)/3+x1^2*((m-4)/2)+((24+n)*x1);
int_area = int_above - int_below;

disp(" ")


%%% ULTRA BONUS
rand("seed",219)
N = 20000;
% Matrix defined
matrix(:,1) = (rand([N,1])-0.5)*12;
matrix(:,2) = (-30) + rand([N,1])*56.330;
matrix(:,3) = matrix(:,1).*m+n; % yd values on the line
matrix(:,4) = matrix(:,1).^2+ matrix(:,1).*4-24; %yd values on the parabola

% Those who fall outside the area of ??the trapezoid
f1 = matrix(:,2)-matrix(:,3)>0;
hs1 = [1:N](f1);
one = matrix(hs1,:);

% Those who fall under the area of ??the trapezoid
two_end = matrix([1:N](not(f1)),:);
n2=rows(two_end);

% Those who fall into the desired region of us
f2 = two_end(:,2)- two_end(:,4)>0;
three = two_end([1:N](f2),:);

% Those falling under the parabola in the area inside the trapezoid
two = two_end([1:N](not(f2)),:);

% Number of points in the desired region
point = rows(three);
% Number of points inside the trapezoid
point2 = rows(two_end);
% area of the trapezoid 
y_area = ((7.2088+56.330)/2)*12; % area of the trapezoid = 381.23 
area = (point*y_area)/point2;

disp("Ultra bonus:")
disp("For trapezoid")
fprintf("Number of Points in the Buffer Zone : %g\n",point);
fprintf("Area of the Buffer Zone : %g\n",area);
disp(" ")
plot(xx,tt,"r-",x_range,parabola,"b-",three(:,1),three(:,2),".b",two(:,1),two(:,2),".r")
pause()




% MONTE CARLO METHOD FOR RECTANGULAR
disp("MONTE CARLO METHOD FOR RECTANGULAR")
rand("seed",219)
N = 10000;
plot(xx,tt,"r-",x_range,parabola,"b-",k1,k2,"g-") % rectangle drawing
pause()
% Matrix defined
matris(:,1) = (rand([N,1])-0.4955)*10.153;
matris(:,2) = (-29) + rand([N,1])*54;
matris(:,3) = matris(:,1).*m+n; % yd values on the line
matris(:,4) = matris(:,1).^2+ matris(:,1).*4-24; % yd values on the parabola

% Those in the Third Region
which_ones1 = matris(:,3) - matris(:,2)>0 & matris(:,4) - matris(:,2)<0;
inside1 = matris([1:N](which_ones1),:);

%Birinci ve Ýkinci Bölgedekiler
outside1 = matris([1:N](not(which_ones1)),:);
total = [inside1;outside1];


% Number of points
n = rows(inside1);
fprintf("Number of Points in the Third Region : %g\n",n);
n1 = rows(outside1);
fprintf("Point Numbers in the First and Second Regions : %g\n",n1);
n3 = rows(total);
fprintf("Total Number of Points : %g\n",n3);


% area of rectangle
rec_area = 548.27;
%Toplam nokta sayýsý = N
area = (n*rec_area)/N;
fprintf("Area of the Third Region Found with Monte Carlo : %g\n",area);
disp(" ")
disp("Bonus: ")
disp("For Rectangle")
fprintf("Area of the Analytical Calculated Third Region : %g\n",int_area);

plot(xx,tt,"r-",x_range,parabola,"b-",k1,k2,"g-",inside1(:,1),inside1(:,2),".b",outside1(:,1),outside1(:,2),".r")
pause()
