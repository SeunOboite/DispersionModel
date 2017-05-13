% This function is used to evaluate the performance
% of air quality, this measures include the FB, MG,
% VG, NSMSE, FAC2 and R

function [FB, MG, NMSE, VG, R_C, FAC2] = evaluation(C_o, C_p, C__o, C__p) 

FB = (C_o - C_p)/(0.5 * (C_o + C_p));
MG = exp(log(C__o) - log(C__p)); % Geometric mean bias
NMSE = ((C_o - C_p)^2)/(C_p * C_o); % Normalized Mean Square Error
VG = exp((log(C__o) - log(C__p)^2)); % Geometric Variance
R_C = ((C_o - C__o) * (C_p - C__p))/(q_c * q_c * C_p * C_o); % relation coeeficient
FAC2 = C_p / C_o; % fraction of prediciton

end