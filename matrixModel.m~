% This function is to calculate the advective flux along
% the street which produce the channeling of pollutant
% along directions to the external wind direction
function [Matrix, Matrixy, Matrixc] = matrixModel(x, y, q, w_e, B, c_0, C, ...
    Q, alpha, beta, h, c)

% Represent the data in matrix form
Matrix = zeros(x - 1, y);
Matrixy = zeros(x, y - 1);
Matrixc = zeros(x,y);

% stand_dev = 1; % standard deviation of the vertical component
% U_d = (stand_dev) / sqrt(2 * pi);% transfer velocity
% Qh_turb_flux = turbulentFlux(U_d, W, L, c_0, c_E);


% Set initial boundary condtions
Matrix(1,1) = 20;
Matrixy(1,1) = 20;

c_a = alpha;
c_b = beta;

Q = 0;

for i = 1:(x)
    for j = 1:(y)
        
        % To ensure the matrix is within rage
        % e.g Matrix (3x4)
        if i ~= x
            if j > 1
                % Conditions for the top matrix
                if i == 1
                    Matrix(i,j) = (0.5 * Q) + (c_a * Matrix(i,j-1));
                else
                    Matrix(i,j) = (0.5 * Q) + (c_a * Matrix(i,j)) + ...
                        (c_b * Matrixy(i,j-1));
                end
            end
        end
        
        % To ensure the matrix is within rage
        % e.g Matrix (4x3)
        if j ~= y
            if i > 1
                if j == 1
                    Matrixy(i,j) = (0.5 * Q) + (c_b * Matrixy(i-1,j));
                else
                    Matrixy(i,j) = (0.5 * Q) + ((1 - c_b) * Matrix(i-1,j)) + ...
                        ((1 - c_b) * Matrixy(i,j-1));
                end
            end
        end
        
    end
end

end