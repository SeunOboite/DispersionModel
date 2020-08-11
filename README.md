# Dispersion Model

This is an interactive network dispersion model used to test against wind tunnel experiments, simulations for a fixed set of receptors and source position and examine responses to changes in the street geometry. 

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites

To get started download the latest version of Matlab (or any version greater than version 6). Follow the instructions on the software installation [here](https://uk.mathworks.com/products/matlab.html?s_tid=hp_products_matlab) for MAC Os and [here] (https://uk.mathworks.com/products/matlab.html?s_tid=hp_products_matlab) for Windows then download this repository.

```
$ git clone git://github.com/iamlyeon/DispersionModel/
```

### Running

To get started with modelling, you can run a simulation with preset values by clicking the 'run' action button on Matlab. The default values for the model is as seen below.

```
% Set constant and initial variables
[B, street_width] = deal(10); % [m]
[street_height, H_0] = deal(5 * 15); % Height of the region above model 
C = 1; % Concentration of pollutants [kg/m^3]
c_0 = C; % Above sea level
q = 1; % Pollutant source emission rate
w_e = 2; % Mixing / entrainment speed
alpha = 0.5;
beta = 0.5;
```
Then inputing the width and length of area to be modelled as requested by the command window:

```
What is the length of the model? 480
What is the width of the model? 480
```

The model produces the following output:
```
The region area is 230400 metres squared, contains 64 houses, 16 streets and 8 intersections.
```

The algorithm also provides mass for the flow in the x street and y street used for further analysis.

## Evaluation

For model evaluation, the current system implements several evaluation methodolgies developed for various disciplines such as the fractional bias (FB), normalized mean square error (NMSE), the geometric mean (MG), geometric variance (VG), the correlation coeeficient and fractional predictions (FAC2). The model provides masses along the street X asis and along the Y axis.

### Start

There are two ways for the model evaluation, the first involves knowing the matrix dimensions and the latter involves getting the matrix dimensions then use it for model evaluation. If the matrix dimensions are unknown comment out the section that imports the .xlsx file. e.g

```
% o_filename = 'ObservedPredictions.xlsx';
% C_p = matrix_street_x; % model predictions 
% C_o = xlsread(o_filename); % model observations
% C__p = mean(C_p); % Average model predictions
% C__o = mean(C_o); % Average model observations
% q_c = 1; % stanfard deviation over the dataset
```

then set the dimesensions (rows and coumn) for the matrix in the .xlsx file. The code imports the matrix and provides the evalutation output. The evaluation methodologies are by no means exhaustive more evaluation techniques can be employed as by changing the evaluation.m file as seen below.
```
function [FB, MG, NMSE, VG, R_C, FAC2, new_evaluation] = evaluation(C_o, C_p, C__o, C__p)
new_evaluation = metholodgy;
end
```
Also changing the finalYearProject.m file:
```
[FB, MG, NMSE, VG, R_C, FAC2, new_evaluation] = evaluation(C_o, C_p, C__o, C__p);
```

## Built With

* [Matlab](https://uk.mathworks.com/products/matlab.html?s_tid=hp_products_matlab) - The Language of Technical Computing


## Contributors

Prof A.G Robins.

## Versioning

The latest version is version 0.1. 

## Authors

**Seun Oboite**


## License

This project is licensed under the [MIT License](LICENSE) and [Vivus Hub](https://www.vivushub.com/) free use license.

## Acknowledgments

* This was developed with strong motivation from the team at Vivus Hud ltd

