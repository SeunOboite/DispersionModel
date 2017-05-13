% This function is to calculate the turbulent transfer
% across the interface between the air in the street
% and the overlying boundary layer

function Qh_turb_flux = turbulentFlux(U_d, W, L, c_0, c_E)

% Standard Concentration approach,
% written in terms of the transfer velocity
Qh_turb_flux = U_d * W * L * (c_0 - c_E);

end