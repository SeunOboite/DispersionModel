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

The model produces the following output
```
The region area is 230400 metres squared, contains 64 houses, 16 streets and 8 intersections.
Concentration for the model at each point along X axis street.
```

## Running the tests

Explain how to run the automated tests for this system

### Break down into end to end tests

Explain what these tests test and why

```
Give an example
```

### And coding style tests

Explain what these tests test and why

```
Give an example
```

## Deployment

Add additional notes about how to deploy this on a live system

## Built With

* [Matlab](https://uk.mathworks.com/products/matlab.html?s_tid=hp_products_matlab) - The Language of Technical Computing


## Contributors

Prof A.G Robins.

## Versioning

The latest version is version 0.1. 

## Authors

**Seun Oboite**


## License

This project is licensed under the [MIT License](LICENSE) and [Checkmate Concevoir](https://www.checkmateconcevoir.com/terms/terms) free use license.

## Acknowledgments

* This was developed with strong motivation from the team at Checkmate Concevoir

