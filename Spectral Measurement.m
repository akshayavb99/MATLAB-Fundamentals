%Calculating the Speed of a Star Relative to Earth.
%You can determine the speed of a star relative to the Earth by calculating the amount of redshift
%It is the change in the wavelengths of light emitted by the star. 
%One way to determine the amount of redshift is to compare the wavelength of a notable feature with its known value.

%This exercise uses the fact that hydrogen-alpha (Hα) is absorbed by many stars that are largely made up of hydrogen.
%The measured wavelength can be detected by using the measured emission spectrum of a star to find a valley near the known Hα wavelength of 656.28 nm.
%Using the difference in the measured and canonical values, you can calculate the redshift. 
%Then, multiply this redshift value by the speed of light to determine the speed at which the star is moving towards or away from the Earth.

%TASK 1: Load the vector HD30584 from the file spectra.mat into MATLAB. It contains the measured spectrum of a star. Each row represents an observed intensity at a particular wavelength of light.
% Create the following four scalars that will be used to create a vector of wavelength values. The wavelengths are given in nanometers (nm).
%   lambda0	 	λ0 = 630.02
%   dLambda	 	Δλ = 0.14
%   nObs	 	nObs = 357
%   lambdaEnd	 	λend = λ0 + (nObs - 1)Δλ

load spectra

lambda0 = 630.02;
dLambda = 0.14;
nObs = 357;
lambdaEnd = lambda0 + (nObs-1)*dLambda;

%TASK 2: Create a column vector lambda that starts at lambda0, and goes in steps of dLambda to lambdaEnd. Plot HD30584 as a function of lambda. Label both axes and add a title.

lambda = (lambda0:dLambda:lambdaEnd)';

plot(lambda,HD30584)
xlabel('\\lambda (nm)')
ylabel('Intensity')
title('Measured Spectrum for Star HD30584')

%TASK 3: Use the xline function to draw a red vertical dashed line on your plot at 656.28 to compare the location of the dip with the laboratory value of the wavelength of Hα radiation.

x = 656.28;
xline(x,'r--');

%TASK 4: Create a vector named anomaly that contains the absolute value of the difference between the flux, HD30584, and its average value.
%        Plot anomaly as a function of lambda by itself.

anomaly = abs(HD30584 - mean(HD30584));

plot(lambda,anomaly)
title('Spectral Anomaly for Star HD30584')
xlabel('\\lambda (nm)')
ylabel('Deviation from mean intensity')

%TASK 5: Calculate the speed of the star relative to Earth.
%         (i)Find the wavelength of the maximum anomaly value, λmax, and name it lambdaMax.
%         (ii)Calculate the redshift, and name it z, where z = λmax/656.28 - 1.
%         (iii)Calculate the speed (in km/s) of the star relative to Earth, by multiplying z by the approximate speed of light, 3×105 km/s. Name the result speed

[~,idx] = max(anomaly);
lambdaMax = lambda(idx);
z = lambdaMax/656.28 - 1;
speed = z*3e5
