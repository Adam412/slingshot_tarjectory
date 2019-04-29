clc;
clear
Mass_of_projectile=.011;%Mass of projectile in kg
L=menu('Choose Stretch Length Type','Inches','Centimeters'); % Menu to choose stretch distance
prompt1={'Enter Stretch Value'}; % Above enterline header
dlg_title1= 'Stretch Length Input'; % Title
num_line=1; % Dimentions
def1={''}; % Definput
x3=inputdlg(prompt1,dlg_title1,num_line,def1); % Inputbox
x5=str2double(x3); % Making 1*1 array to scalar
if L==1
  Stretch_Distance =x5*2.54/100; % Converts inches to meters
    disp('Stretch in Inches');
  display(x5);
else
    Stretch_Distance=x5/100; %Converts centimeters to meters
      disp('Stretch in Centimeters');
  display(x5);
end       % Spits out Stretch in meters
C=menu('Choose Angle Type','Degrees','Radians'); % menu to choose angle type
prompt={'Enter Angle Value'}; % Above enterline header
dlg_title= 'Angle Input'; %title
num_lines=1; % Dimentions
def={''}; % Definput
x=inputdlg(prompt,dlg_title,num_lines,def); %Inputbox
x1=str2double(x); % Making 1*1 array to scalar
if C==1
    angle=x1; % Angle in dergrees
      disp('Angle in Degrees');
  display(x1);
else
    angle=x1*(180/(pi)); % Converts radians to degress
      disp('Angle in Radians');
  display(x1);
end           % Spits out angles in degress
fun = @(x) 869.48*x.^4-814.62*x.^3+290.94*x.^2+52.65*x+.0164;%equation of Force vs Distance % need dimentions same
g = -9.81;%Acceleration of gravity (m/s^2)
Ax = 0;%Acceleration in x Direction(m/s^2)
Ay= g;%Acceleration in y Direction(m/s^2)
V0=sqrt((((integral(fun,0,Stretch_Distance))*2)/(Mass_of_projectile)));%Velocity of Force_vs_Distance graph (m/s)
L1=menu('Choose Displacement Height','Meters','Feet','Inches','Centimeters'); % Choose displacement lengths
prompt3={'Enter Initial Height','Enter Final Height'}; % Enterline titles
dlg_title3= 'Displacement Height Input'; %Box title
num_lines3=1; % Dimentions
def3={'',''}; % Definput
x4=inputdlg(prompt3,dlg_title3,num_lines3,def3);% Inputbox
x6=str2double(x4{1});% array to scalar
x7=str2double(x4{2});% array to scalar
if L1==1
    x10=x7;% converts to meters
    x11=x6;% converts to meters
  delta_y =x10-x11; % finding delta_y in meters
  disp('Displacement in Meters');
  display(x7-x6);
elseif L1==2
    x10=(x7*12*2.54/100); % converts to meters
    x11=(x6*12*2.54/100);% converts to meters
   delta_y=x10-x11;% finding delta_y in meters
   disp('Displacement in Feet');
  display(x7-x6);
elseif L1==3
    x10=(x7*2.54/100);% converts to meters
    x11=(x6*2.54/100);% converts to meters
    delta_y=x10-x11;% finding delta_y in meters
    disp('Displacement in Inches');
  display(x7-x6);
else
    x10=(x7/100);% converts to meters
    x11=(x6/100);% converts to meters
    delta_y=x10-x11;% finding delta_y in meters
    disp('Displacement in Centimeters');
  display(x7-x6);
end
	xVelocity = V0 * cosd(angle); %X direction velocity (m/s)
	yVelocity = V0 * sind(angle); %Y direction velocity (m/s)
    t=(-yVelocity-sqrt((yVelocity)^(2)-2*g*(-delta_y)))/(g);% Max time (s)
	Distance = xVelocity .* t + (1/2) * Ax .* t.^2;%Finding distance in x (m)
	Final_Height = yVelocity .* t + (1/2) * Ay .* t.^2; %Finding height at final time (m)
	t1= 0 : .001 : t;%Time array for graph (s) has error in .0001
    x15 = xVelocity .* t1 + (1/2) * Ax .* t1.^2;%Finding distance in x (m)
	y1 = x11 + yVelocity .* t1 + (1/2) * Ay .* t1.^2;%Finding height at final time (m)
    plot(x15, y1); % plot of terjectory fitted to graph
    title('The Trajectory of Projectile')
    xlabel('Distance Traveled in x Direction (m)');
    ylabel('Distance Traveled in y Direction (m)');
    Max_Distance= max(x15);% max distance in x axis traveled
    disp('Max distance in x Direction in Meters');
    display(Max_Distance-0);
