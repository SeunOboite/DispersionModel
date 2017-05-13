% This function is to calculate
% the concentration in the street
% as seen in the Dissertation [Eqn 31]

function C_street_sol = C_street(total_Q, w_e)

W = 5; % [m]
L = 5 * 15; % [m]
H = 5 * 15; % [m]
U_street = w_e;

[Qsi, Qli] = deal(total_Q);

a = 10^-4; % [h mm-1 s-1]
b = 1; %
Pr = 0.26; % precipitation intensity [mm h-1]

Z = a * (Pr^b); % pollutant rate

C_street_sol = (Qsi + Qli)/(((W * L)/sqrt(2 * pi)) + ...
    (H * W * U_street) ...
    + (Z * H * W * L));

end