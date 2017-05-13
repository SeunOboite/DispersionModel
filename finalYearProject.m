% FInal Year Project 2016 - 2017 Street Network Model
% Copyright of Seun Oboite (c) 1996 - 2017
% This code is registered under the MIT license
% and Checkmate Concevoir open source licence
% (https://www.checkmateconcevoir.com/terms/terms)

% Clear workspace and prepare command window
clear all; close all; clc;

% Set constant and initial variables
[B, street_width] = deal(10); % [m]
[street_height, H_0] = deal(5 * 15); % Height of the region above model 
C = 1; % Concentration of pollutants [kg/m^3]
c_0 = C; % Above sea level
q = 1; % Pollutant source emission rate
w_e = 2; % Mixing / entrainment speed
alpha = 0.5;
beta = 0.5;

% Volume flow rate of air [m^3/s]
Q = q + ((w_e * B) * (c_0 - C));

% Ask users for the length and width of the working area
prompt_length = 'What is the length of the model? ';
prompt_width = 'What is the width of the model? ';

% Collect length of the users
region_length = input(prompt_length);
region_width = input(prompt_width);

% Set values to different variable
% this would be used later
region_length_y = region_length;
region_width_x = region_width;


% The dispersion model is assumed to
% be bounded by street at each axis
% Hence set the initial vars for the streets
no_of_street_x = 0; 
no_of_street_y = 0;

% Set initial varibbles for the houses
no_of_houses_x = 0;
no_of_houses_y = 0;

% Assumed house width and length
house_width = 50; % [m]
house_length = 50; % [m]

% Calculate the house and rigional area
house_area = house_width * house_length; % [m^2]
region_area = region_length_y * region_width_x; % [m^2]

% Calculate the number of streets in x axis
% Check if the region with can still accept
% an additional house
while house_width <= region_width
    
    % Check if the last region length 
    % ends with a house or a street
    if region_width ~= street_width
        no_of_houses_x = no_of_houses_x + 1;         
    end
    
    % Increment number of streets 
    no_of_street_x = no_of_street_x + 1;
    
    % Reduce by house length and and steet width
    region_width = region_width - house_width - street_width;
    
end

% Calculate the number of streets in y axis
while house_length <= region_length
    
    % Check if the last region length 
    % ends with a house or a street
    if region_length ~= street_width
        no_of_houses_y = no_of_houses_y + 1;       
    end
    
    % Increment number of streets 
    no_of_street_y = no_of_street_y + 1;
    
    % Reduce by house length and and steet width
    region_length = region_length - house_width - street_width; 
    
end

% Number of houses and streets
number_of_houses = no_of_houses_x * no_of_houses_y;
number_of_street = no_of_street_x + no_of_street_y;
 
% Number of junctions / intersection
number_of_intersection = no_of_street_x; % 4 connecting streets

% Convert street data into matrix and call function
% It is assumed the left and right boundaries are bounded by a street
% but the top and buttom isn't 
[matrix_street_x, matrix_street_y, matrix_street_c] = matrixModel(no_of_street_x, ...
    no_of_street_y, q, w_e, B, c_0, C, Q, alpha, beta, H_0, 0);

% Output the data / Display results
disp(['The region area is ', num2str(region_area), ' metres squared,', ...
    ' contains ', num2str(number_of_houses), ' houses, ', ...
    num2str( number_of_street), ' streets and ', ...
    num2str(number_of_intersection), ' intersections.']);

% If the matrix is too big for display then trim it
% and ask the user to view the workspace.
if size(matrix_street_x,2) < 10  
    disp('Concentration for the model at each point along X axis street.');
    disp(matrix_street_x);
    
    disp('Concentration for the model at each point along Y axis street.');
    disp(matrix_street_y);
else
    disp('Matrix to large, view the work space for more information.');
end

% Save matrix for future use
o_matrix_street_x = matrix_street_x;
o_matrix_street_y = matrix_street_y;
o_matrix_street_c = matrix_street_c;

% Scatte plot for current data
% Convert data to vector state for plotting
% more infromation about this can be found
% http://uk.mathworks.com/help/matlab/ref/scatter.html
matrix_street_x = matrix_street_x(:)';
matrix_street_y = matrix_street_y(:)';
matrix_street_c = matrix_street_c(:)';

% Write the file to a csv file
% Write the concentration in the x axis
xlswrite('concentration_x.xls', o_matrix_street_x);

% Write the concentration in the y axis
xlswrite('concentration_y.xls', o_matrix_street_y);

% Plot data
% 2D dimension of the plot
% scatter(matrix_street_x, matrix_street_y);

set(gca,'ydir','reverse');
set(gca,'xdir','reverse');

% % 3D dimension of the plot
% scatter3(matrix_street_x, matrix_street_y, matrix_street_y, 'filled');
% view(45,45); % Set the view
% % Data titles and labels
% title('Street Network Diagram');
% xlabel('Concentration along x axis');
% ylabel('Cocentration along y axis');

% Evaluating the predictions of the model with observation
% Set initial variables
o_filename = 'ObservedPredictions.xlsx';
C_p = matrix_street_x; % model predictions 
C_o = xlsread(o_filename); % model observations
C__p = mean(C_p); % Average model predictions
C__o = mean(C_o); % Average model observations
q_c = 1; % stanfard deviation over the dataset

% Evaluating the model
[FB, MG, NMSE, VG, R_C, FAC2] = evaluation(C_o, C_p, C__o, C__p);
